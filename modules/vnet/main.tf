resource "azurerm_virtual_network" "cust_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "cust_subnet" {
  for_each = var.subnets != null ? {
    for resource in var.subnets : "${resource.subnet_name}" => resource
  } : {}
  name                 = each.value.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.cust_vnet.name
  address_prefixes     = each.value.subnet_address_prefix
  #private_endpoint_network_policies_enabled = lookup(each.value, "enforce_private_link_endpoint_network_policies", null)
  private_endpoint_network_policies = lookup(each.value, "enforce_private_link_service_network_policies", null)
  service_endpoints                 = lookup(each.value, "service_endpoints", [])
  dynamic "delegation" {
    # for_each = lookup(each.value, "delegation", {})
    for_each = each.value.delegation != null ? each.value.delegation : []
    content {
      name = each.value.delegation[0].name
      service_delegation {
        name    = lookup(each.value.delegation[0].service_delegation, "name", null)
        actions = lookup(each.value.delegation[0].service_delegation, "actions", null)
      }
    }
  }
}

output "mso_bd" {
  value = {
    for_each = var.subnets != null ? {
      for resource in var.subnets : "${resource.subnet_name}" => resource
    } : {}
  }
}

resource "azurerm_network_security_group" "cust_nsg" {
  for_each = var.subnets != null ? {
    for resource in var.subnets : "${resource.subnet_name}" => resource
    #if length(resource.nsg_inbound_rules) > 0 ? true : length(resource.nsg_outbound_rules) > 0 ? true : false
    if resource.create_nsg ? true : false
  } : {}

  name                = "nsg-${each.value.subnet_name}"
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags

  dynamic "security_rule" {
    for_each = concat(lookup(each.value, "nsg_inbound_rules", []), lookup(each.value, "nsg_outbound_rules", []))
    content {
      name                       = security_rule.value[0] == "" ? "Default_Rule" : security_rule.value[0]
      priority                   = security_rule.value[1]
      direction                  = security_rule.value[2] == "" ? "Inbound" : security_rule.value[2]
      access                     = security_rule.value[3] == "" ? "Allow" : security_rule.value[3]
      protocol                   = security_rule.value[4] == "" ? "Tcp" : security_rule.value[4]
      source_port_range          = "*"
      destination_port_range     = security_rule.value[5] == "" ? "*" : security_rule.value[5]
      source_address_prefix      = security_rule.value[6] == "" ? element(each.value.subnet_address_prefix, 0) : security_rule.value[6]
      destination_address_prefix = security_rule.value[7] == "" ? element(each.value.subnet_address_prefix, 0) : security_rule.value[7]
      description                = "${security_rule.value[2]}_Port_${security_rule.value[5]}"
    }
  }
}



resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
  for_each = var.subnets != null ? {
    for resource in var.subnets : "${resource.subnet_name}" => resource
    #if length(resource.nsg_inbound_rules) > 0 ? true : length(resource.nsg_outbound_rules) > 0 ? true : false
    if resource.create_nsg ? true : false
  } : {}
  subnet_id                 = azurerm_subnet.cust_subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.cust_nsg[each.key].id
}
