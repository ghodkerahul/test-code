# resource "azurerm_log_analytics_workspace" "eus_prod_la" {
#   for_each            = local.environments
#   name                = each.value.loganalytics_name
#   location            = local.platform_location
#   resource_group_name = azurerm_resource_group.platform_application_rg[each.key].name
#   sku                 = each.value.loganalytics_sku
#   retention_in_days   = each.value.loganalytics_workspace_retention
#   tags                = each.value.tags_platform_application

#   lifecycle {
#     ignore_changes = [
#       retention_in_days

#     ]
#   }
# }

# resource "azurerm_log_analytics_workspace" "eus_mwadminmanagement_prod_la" {
#   for_each            = local.environments
#   name                = each.value.mwadminmanagement_loganalytics_name
#   location            = local.platform_location
#   resource_group_name = azurerm_resource_group.mwadminmanagement_application_rg[each.key].name
#   sku                 = each.value.loganalytics_sku
#   retention_in_days   = each.value.loganalytics_workspace_retention
#   tags                = each.value.tags_modernworkplace_application
# }

# resource "azurerm_log_analytics_workspace" "eus_mwwubreporting_prod_la" {
#   for_each            = local.environments
#   name                = each.value.mwwubreporting_loganalytics_name
#   location            = local.platform_location
#   resource_group_name = azurerm_resource_group.mwwubreporting_application_rg[each.key].name
#   sku                 = each.value.loganalytics_sku
#   retention_in_days   = each.value.loganalytics_workspace_retention
#   tags                = each.value.tags_modernworkplace_application
# }

# resource "azurerm_log_analytics_workspace" "eus_mwenhancedinventory_prod_la" {
#   for_each            = local.environments
#   name                = each.value.mwenhancedinventory_loganalytics_name
#   location            = local.platform_location
#   resource_group_name = azurerm_resource_group.mwenhancedinventory_application_rg[each.key].name
#   sku                 = each.value.loganalytics_sku
#   retention_in_days   = each.value.loganalytics_workspace_retention
#   tags                = each.value.tags_modernworkplace_application
# }

# /*
# resource "azurerm_log_analytics_linked_service" "eus_prod_la_automation_link" {
#   for_each            = local.environments
#   resource_group_name = azurerm_resource_group.platform_application_rg[each.key].name
#   workspace_id        = azurerm_log_analytics_workspace.eus_prod_la[each.key].id
#   read_access_id      = azurerm_automation_account.eus_prod_aa[each.key].id
# }
# */