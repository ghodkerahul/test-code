#resource "azurerm_subscription_policy_assignment" "sub_backup_policy" {
#  name                 = "DINE-Backup-${data.azurerm_subscription.current.subscription_id}-${local.platform_location}"
#  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/345fa903-145c-4fe1-8bcd-93ec2adccde8"
#  subscription_id      = data.azurerm_subscription.current.id
#  location             = local.platform_location
#  identity {
#    type = "SystemAssigned"
#  }
#  parameters = <<PARAMETERS
#  {
#    "effect": {
#      "value": "deployIfNotExists"
#    },
#    "vaultLocation": {
#      "value": "${local.platform_location}"
#    },
#    "inclusionTagName": {
#      "value": "${local.platform_backup_tag}"
#    },
#    "inclusionTagValue": {
#      "value": ["${local.platform_backup_tag_value}"]
#    },
#    "backupPolicyId": {
#      "value": "${azurerm_backup_policy_vm.vm_backup_policy.id}"
#    }
#  }
#  PARAMETERS
#}

#resource "azurerm_role_assignment" "sub_backup_policy_msiassignment" {
#  for_each             = toset(["Virtual Machine Contributor", "Backup Contributor"])
#  scope                = azurerm_subscription_policy_assignment.sub_backup_policy.subscription_id
#  role_definition_name = each.key
#  principal_id         = azurerm_subscription_policy_assignment.sub_backup_policy.identity[0].principal_id
#}
