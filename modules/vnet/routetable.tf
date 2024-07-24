resource "azurerm_route_table" "cust_rt" {
  for_each = var.subnets != null ? {
    for resource in var.subnets : "${resource.subnet_name}" => resource
    if length(resource.route_table_routes) > 0
  } : {}
  name                          = "rt-${var.vnet_name}-${each.value.subnet_name}"
  resource_group_name = var.rg_name
  location            = var.location
  disable_bgp_route_propagation = true

  dynamic "route" {
    for_each = each.value.route_table_routes != null ? each.value.route_table_routes : []
    content {
      name           = route.value.name
      address_prefix = route.value.address_prefix
      next_hop_type  = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_type == "VirtualAppliance" ? lookup(route.value, "next_hop_in_ip_address", null) : null
    }
  }
  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "cust_rt_subnet" {
  for_each = var.subnets != null ? {
    for resource in var.subnets : "${resource.subnet_name}" => resource
    if length(resource.route_table_routes) > 0
  } : {}
  subnet_id      = azurerm_subnet.cust_subnet[each.key].id
  route_table_id = azurerm_route_table.cust_rt[each.key].id
  depends_on = [
      azurerm_subnet.cust_subnet
  ]
}
