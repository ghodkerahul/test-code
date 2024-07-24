locals {

  prod = {

    platform_application_rg_name               = "rg-eus-mwadminsinventory-prod-weu-001"
    powerplatform_application_rg_name          = "rg-eus-powerplatformcoe-prod-weu-001"
    mwadminmanagement_application_rg_name      = "rg-eus-mwadminmanagement-prod-weu-001"
    mwwubreporting_application_rg_name         = "rg-eus-mwwubreporting-prod-weu-001"
    mwenhancedinventory_application_rg_name    = "rg-eus-mwenhancedinventory-prod-weu-001"
    loganalytics_name                          = "la-eus-mwadminsinventory-prod-weu-001"
    mwadminmanagement_loganalytics_name        = "la-eus-mwadminmanagement-prod-weu-001"
    mwwubreporting_loganalytics_name           = "la-eus-mwwubreporting-prod-weu-001"
    mwenhancedinventory_loganalytics_name      = "la-eus-mwenhancedinventory-prod-weu-001"
    loganalytics_sku                           = "PerGB2018"
    loganalytics_workspace_retention           = 90
    keyvault_admin_objectid                    = "9d4259bc-83d7-4014-bfd9-936b41e5d4a0"
    la_workspaceadmin_objectid                 = "a9528543-fe22-481a-9159-57b615a82c28"
    la_workspacereader_objectid                = "4faca47d-5a45-4b8b-9e5a-80ff025bb739"
    mwenhanced_la_workspaceadmin_objectid      = "2805a177-d680-4500-8bda-fb3a882abc98"
    mwenhanced_la_workspacereader_objectid     = "3a70cf71-84dd-49bc-abb5-044c4f3d4dc0"
    mwwubreporting_la_workspaceadmin_objectid  = "233bdc7c-235b-41b2-8f17-89024d0b8899"
    mwwubreporting_la_workspacereader_objectid = "96bc03ee-b0e4-4ec1-90c4-24eab3ee01ca"

    #automation_account_name          = "aa-eus-mwadminsinventory-prod-weu-001"
    platform_vnet_rg                         = "rg-platform-vnet-prod-weu-001"
    key_vault_subnet_name                    = "snet-native-eus-se-prod-weu-001"
    key_vault_privateEP_name                 = "pe-kv-powerplatform-prod-weu-001"
    key_vault_private_serviceconnection_name = "psc-kv-powerplatform-prod-weu-001"

    tags = {
      application    = "power platform"
      criticality    = "Medium"
      businessunit   = "K-IT"
      opscommitment  = "Platform Operations"
      opsteam        = "CloudOps"
      env            = "prod"
      iac-deployment = "TRUE"
      it-owner       = "teija.alin@kesko.fi"
      sub-service    = "c1377"
      mgmtvendor        = "tietoevry"
      applicationvendor = "tietoevry"
    }
    tags_platform_application = {
      application    = "modernworkplace"
      criticality    = "Medium"
      businessunit   = "K-IT"
      opscommitment  = "Platform Operations"
      opsteam        = "CloudOps"
      it-owner       = "jan.gronholm@kesko.fi"
      sub-service    = "C1162"
      env            = "prod"
      iac-deployment = "TRUE"

    }

    tags_powerplatform_application = {
      application    = "power platform"
      criticality    = "Medium"
      businessunit   = "K-IT"
      opscommitment  = "Platform Operations"
      opsteam        = "CloudOps"
      it-owner       = "teija.alin@kesko.fi"
      sub-service    = "C1137"
      env            = "prod"
      iac-deployment = "TRUE"

    }
    tags_modernworkplace_application = {
      application       = "modernworkplace"
      criticality       = "Medium"
      businessunit      = "K-IT"
      opscommitment     = "Platform Operations"
      opsteam           = "CloudOps"
      it-owner          = "jan.gronholm@kesko.fi"
      sub-service       = "C1162"
      mgmtvendor        = "tietoevry"
      applicationvendor = "tietoevry"
      amscontact        = "jussi.tuominen@tietoevry.com"
    }

    platform_vnet = {
      name           = "vnet-native-eus-prod-weu-001"
      address_prefix = ["10.246.20.128/25"]
      dns_servers    = ["10.246.116.4", "10.246.116.5"]
      subnet = [
        {
          name          = "snet-native-eus-se-prod-weu-001"
          addressprefix = ["10.246.20.128/28"]
          #create_nsg = false
          nsg_inbound_rules = [
          ]
          nsg_outbound_rules = [
          ]
          enforce_private_link_endpoint_network_policies = "false"
          # delegation = [{
          #  name = "testdelegation"
          #  service_delegation = {
          #    name    = "Microsoft.ContainerInstance/containerGroups"
          #    actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
          #  }
          #}]
          route_table_routes = [
            {
              name                   = "DefaultRoute_to_firewall"
              address_prefix         = "0.0.0.0/0"
              next_hop_type          = "VirtualAppliance"
              next_hop_in_ip_address = "10.246.113.4"
            },
          ]
          service_endpoints = []
        }

      ]
    }
  }
}





