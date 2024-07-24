# resource "azurerm_recovery_services_vault" "pl_recovery_vault" {
#   name                = local.platform_rsv_name
#   location            = azurerm_resource_group.rg_platform_backup.location
#   resource_group_name = azurerm_resource_group.rg_platform_backup.name
#   sku                 = "Standard"
#   tags                = local.tags
# }

# resource "azurerm_backup_policy_vm" "vm_backup_policy" {
#   name                = "default-vm-policy"
#   resource_group_name = azurerm_resource_group.rg_platform_backup.name
#   recovery_vault_name = azurerm_recovery_services_vault.pl_recovery_vault.name

#   timezone = "FLE Standard Time"

#   backup {
#     frequency = "Daily"
#     time      = "03:00"
#   }
#   retention_daily {
#     count = 7
#   }
#   retention_weekly {
#     count    = 4
#     weekdays = ["Sunday"]
#   }

#   retention_monthly {
#     count    = 4
#     weekdays = ["Sunday"]
#     weeks    = ["Last"]
#   }

#   #   retention_yearly {
#   #     count    = 2
#   #     weekdays = ["Sunday"]
#   #     weeks    = ["Last"]
#   #    months   = ["December"]
#   #   }
#   depends_on = [
#     azurerm_recovery_services_vault.pl_recovery_vault
#   ]
# }
