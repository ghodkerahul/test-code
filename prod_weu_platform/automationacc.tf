
/*
resource "azurerm_automation_account" "eus_prod_aa" {
  for_each            = local.environments
  name                = each.value.automation_account_name
  location            = local.platform_location
  resource_group_name = azurerm_resource_group.platform_application_rg[each.key].name
  sku_name            = "Basic"
  tags                = each.value.tags
}
*/