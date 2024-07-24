data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

# data "azuread_group" "devops" {
#   display_name     = local.platform_application_devops_group
#   security_enabled = true
# }

# data "azuread_group" "reader" {
#   display_name     = local.platform_application_reader_group
#   security_enabled = true
# }