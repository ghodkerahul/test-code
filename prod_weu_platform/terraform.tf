#
# Terraform settings
#

terraform {
  backend "azurerm" {
    resource_group_name  = variable.resource_group_name
    storage_account_name = varaible.storage_account_name
    container_name       = variable.container_name
    key                  = variable.key
  }

  required_version = ">= 1.0.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.28.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2.3"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.8.0"
    }
  }
}


# provider "azurerm" {
#   alias                      = "platform"
#   subscription_id            = local.platform_sub
#   skip_provider_registration = true
#   features {}
# }

# provider "azurerm" {
#   alias                      = "iaas"
#   subscription_id            = "5a0855b9-426d-429e-83a9-ea7c4796e9a4" # kesko-iaas-prod
#   skip_provider_registration = true
#   features {}
# }