locals {

  platform_sub      = "5a0855b9-426d-429e-83a9-ea7c4796e9a4"
  platform_location = "westeurope"
  # platform_rsv_name                       = "rsv-platform-appz-prod-weu-001"
  # platform_backup_tag                     = "backup"
  # platform_backup_tag_value               = "default"
  # platform_application_devops_group       = "az-eslz-test-contributor"
  # platform_application_devops_role        = "[KGROUP] DevOps-Contributor"
  # platform_application_vnet_operator_role = "[KGROUP] Network-Vnet-Operator"
  # platform_application_reader_group       = "az-eslz-test-reader"
  # platform_application_reader_role        = "Reader"

  # tags = {
  #   application   = "Terraform"
  #   criticality   = "Medium"
  #   businessunit  = "K-IT"
  #   opscommitment = "Platform Operations"
  #   opsteam       = "CloudOps"
  # }

  environments = {
    prod = local.prod
  }
}