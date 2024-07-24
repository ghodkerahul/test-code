locals {
  platform_subnets = {
    for environment_key, environment in local.environments : environment_key => flatten([
      for resource_key, resource_name in environment.platform_vnet.subnet : {
        resource_key                      = resource_key
        subnet_name                       = resource_name.name
        subnet_address_prefix             = resource_name.addressprefix
        nsg_inbound_rules                 = resource_name.nsg_inbound_rules
        nsg_outbound_rules                = resource_name.nsg_outbound_rules
        route_table_routes                = resource_name.route_table_routes
        delegation                        = lookup(resource_name, "delegation", [])
        service_endpoints                 = lookup(resource_name, "service_endpoints", [])
        private_endpoint_network_policies = resource_name.enforce_private_link_endpoint_network_policies
        create_nsg                        = try(resource_name.create_nsg, true)
      }
    ])
  }
}

module "vnet" {
  for_each           = local.environments
  source             = "../modules/vnet"
  vnet_name          = each.value.platform_vnet.name
  location           = local.platform_location
  rg_name            = azurerm_resource_group.platform_vnet_rg[each.key].name
  vnet_address_space = each.value.platform_vnet.address_prefix
  dns_servers        = each.value.platform_vnet.dns_servers
  subnets            = lookup(local.platform_subnets, each.key, [])
  tags               = each.value.tags
}
