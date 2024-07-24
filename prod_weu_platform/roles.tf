# ##Used for Native App, subscription based permissions. 

# #resource "azurerm_role_assignment" "native_sub_reader" {
# #  scope                = data.azurerm_subscription.current.id
# #  role_definition_name = local.platform_application_reader_role
# #  principal_id         = data.azuread_group.reader.id
# #}

# #resource "azurerm_role_assignment" "native_sub_devops_contributor" {
# #  scope                = data.azurerm_subscription.current.id
# #  role_definition_name = local.platform_application_devops_role
# #  principal_id         = data.azuread_group.devops.id
# #}

# resource "azurerm_role_assignment" "mwadmininventory-contributor" {
#   for_each             = local.environments  
#   scope                = azurerm_resource_group.platform_application_rg[each.key].id
#   role_definition_name = "Contributor" # In order to save new workbooks, need to have more rights scoped in the RG level as well, as workbooks are resources by themselves
#   principal_id         = local.prod.la_workspaceadmin_objectid
# }

# resource "azurerm_role_assignment" "keyvault_admin" {
#   for_each             = local.environments
#   scope                = azurerm_key_vault.powerkv[each.key].id
#   role_definition_name = "Key Vault Administrator"
#   principal_id         = each.value.keyvault_admin_objectid
# }

# resource "azurerm_role_assignment" "la_workspaceadmin" {
#   for_each             = local.environments
#   scope                = azurerm_log_analytics_workspace.eus_prod_la[each.key].id
#   role_definition_name = "Log Analytics Contributor"
#   principal_id         = each.value.la_workspaceadmin_objectid
# }

# resource "azurerm_role_assignment" "la_workspacereader" {
#   for_each             = local.environments
#   scope                = azurerm_log_analytics_workspace.eus_prod_la[each.key].id
#   role_definition_name = "Log Analytics Reader"
#   principal_id         = each.value.la_workspacereader_objectid
# }

# resource "azurerm_role_assignment" "mwadminmanagement_la_workspaceadmin" {
#   for_each             = local.environments
#   scope                = azurerm_log_analytics_workspace.eus_mwadminmanagement_prod_la[each.key].id
#   role_definition_name = "Log Analytics Contributor"
#   principal_id         = each.value.la_workspaceadmin_objectid
# }

# resource "azurerm_role_assignment" "mwadminmanagement_la_workspacereader" {
#   for_each             = local.environments
#   scope                = azurerm_log_analytics_workspace.eus_mwadminmanagement_prod_la[each.key].id
#   role_definition_name = "Log Analytics Reader"
#   principal_id         = each.value.la_workspacereader_objectid
# }

# resource "azurerm_role_assignment" "mwenhancedinventory_la_workspaceadmin" {
#   for_each             = local.environments
#   scope                = azurerm_resource_group.mwenhancedinventory_application_rg[each.key].id
#   role_definition_name = "Contributor"
#   principal_id         = each.value.mwenhanced_la_workspaceadmin_objectid
# }

# resource "azurerm_role_assignment" "mwenhancedinventory_la_workspacereader" {
#   for_each             = local.environments
#   scope                = azurerm_resource_group.mwenhancedinventory_application_rg[each.key].id
#   role_definition_name = "Log Analytics Reader"
#   principal_id         = each.value.mwenhanced_la_workspacereader_objectid
# }

# resource "azurerm_role_assignment" "mwwubreporting_la_workspaceadmin" {
#   for_each             = local.environments
#   scope                = azurerm_resource_group.mwwubreporting_application_rg[each.key].id
#   role_definition_name = "Contributor"
#   principal_id         = each.value.mwwubreporting_la_workspaceadmin_objectid
# }

# resource "azurerm_role_assignment" "mwwubreporting_la_workspacereader" {
#   for_each             = local.environments
#   scope                = azurerm_log_analytics_workspace.eus_mwwubreporting_prod_la[each.key].id
#   role_definition_name = "Log Analytics Reader"
#   principal_id         = each.value.mwwubreporting_la_workspacereader_objectid
# }

# resource "azurerm_role_assignment" "mwwubreporting_rg_reader" {
#   for_each             = local.environments
#   scope                = azurerm_resource_group.mwwubreporting_application_rg[each.key].id
#   role_definition_name = "Reader"
#   principal_id         = each.value.mwwubreporting_la_workspacereader_objectid
# }
