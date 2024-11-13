variable "location" {
  description = "Azure region where the resources will be created."
  type        = string
  default = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group for networking resources."
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnet configurations."
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "nsg_name" {
  description = "Name of the Network Security Group."
  type        = string
  default     = "nsg_sh_  "
}

variable "global_suffix" {
  description = "A unique suffix for naming resources, passed from the global configuration."
  type        = string
}