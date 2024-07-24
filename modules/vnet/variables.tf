
variable "rg_name" {
  description = "rg name for the vnet"
  default     = "rg_test001"
}

variable "vnet_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "test001"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
}

variable "hub_vnet_name" {
  description = "The name of the virtual network"
  default     = ""
}

variable "vnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "List of dns servers to use for virtual network"
  default     = []
}

variable "subnets" {
  description = "For each subnet, create an object that contain fields"
  default     = null
}

variable "route_table_routes" {
  description = "For each subnet, create a route table associated"
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "environment" {
  type        = string
  description = "The variable is used to define deployment environment"
  default     = ""
}
