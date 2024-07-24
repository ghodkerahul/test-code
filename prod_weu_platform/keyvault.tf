

# data "azurerm_client_config" "current" {}

# data "azurerm_subnet" "current" {
#   for_each             = local.environments
#   name                 = each.value.key_vault_subnet_name
#   virtual_network_name = each.value.platform_vnet.name
#   resource_group_name  = azurerm_resource_group.platform_vnet_rg[each.key].name
# }

# data "azurerm_subnet" "ci" {
#   provider             = azurerm.iaas
#   name                 = "snet-iaas-aksrunners-prod-weu-001"
#   virtual_network_name = "vnet-iaas-shared-prod-weu-001"
#   resource_group_name  = "rg-platform-iaas-prod-weu-001"
# }

# resource "azurerm_key_vault" "powerkv" {

#   for_each = local.environments

#   name = "kv-eus-pp-prod-weu-002"

#   location                      = local.platform_location
#   resource_group_name           = azurerm_resource_group.powerplatform_application_rg[each.key].name
#   enabled_for_disk_encryption   = true
#   tenant_id                     = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days    = 7
#   purge_protection_enabled      = true
#   public_network_access_enabled = false
#   sku_name                      = "standard"
#   tags                          = each.value.tags_powerplatform_application
#   enable_rbac_authorization     = true

#   network_acls {
#     default_action             = "Deny"
#     bypass                     = "AzureServices"
#     virtual_network_subnet_ids = [data.azurerm_subnet.ci.id]
#   }

#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#   }



# }

# resource "azurerm_private_endpoint" "key_vault" {
#   for_each            = local.environments
#   name                = each.value.key_vault_privateEP_name
#   location            = local.platform_location
#   resource_group_name = azurerm_resource_group.powerplatform_application_rg[each.key].name
#   subnet_id           = data.azurerm_subnet.current[each.key].id

#   private_service_connection {
#     name                           = each.value.key_vault_private_serviceconnection_name
#     private_connection_resource_id = azurerm_key_vault.powerkv[each.key].id
#     subresource_names              = ["vault"]
#     is_manual_connection           = false
#   }

#   lifecycle {
#     ignore_changes = [
#       private_dns_zone_group,
#       tags,
#     ]
#   }
# }
# #