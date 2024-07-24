# resource "azurerm_resource_group" "platform_vnet_rg" {
#   for_each = local.environments
#   name     = each.value.platform_vnet_rg
#   location = local.platform_location
#   tags     = each.value.tags
# }

# resource "azurerm_resource_group" "rg_platform_backup" {
#   name     = "rg-${local.platform_rsv_name}"
#   location = local.platform_location
#   tags     = local.tags
# }

#NetworkWatcherRG can't be created by policy without tags. Add by default, if subscription doesn't already contain this RG. Comment out, if already exists.
#resource "azurerm_resource_group" "networkwatcher" {
#  name     = "NetworkWatcherRG"
#  location = local.platform_location
#  tags     = local.tags
#}

resource "azurerm_resource_group" "platform_application_rg" {
  for_each = local.environments
  name     = each.value.platform_application_rg_name
  location = local.platform_location
  tags     = each.value.tags_platform_application
}

resource "azurerm_resource_group" "powerplatform_application_rg" {
  for_each = local.environments
  name     = each.value.powerplatform_application_rg_name
  location = local.platform_location
  tags     = each.value.tags_powerplatform_application
}

resource "azurerm_resource_group" "mwadminmanagement_application_rg" {
  for_each = local.environments
  name     = each.value.mwadminmanagement_application_rg_name
  location = local.platform_location
  tags     = each.value.tags_modernworkplace_application
}

resource "azurerm_resource_group" "mwwubreporting_application_rg" {
  for_each = local.environments
  name     = each.value.mwwubreporting_application_rg_name
  location = local.platform_location
  tags     = each.value.tags_modernworkplace_application
}

resource "azurerm_resource_group" "mwenhancedinventory_application_rg" {
  for_each = local.environments
  name     = each.value.mwenhancedinventory_application_rg_name
  location = local.platform_location
  tags     = each.value.tags_modernworkplace_application
}

resource "azurerm_resource_group" "platform_vnet_rg" {
  for_each = local.environments
  name     = each.value.platform_vnet_rg
  location = local.platform_location
  tags     = each.value.tags
}

