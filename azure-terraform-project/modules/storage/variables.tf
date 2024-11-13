variable "location" {
  description = "The Azure region where the storage account will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the storage account."
  type        = string
}

variable "base_name" {
  description = "The base name for the storage account, to which a unique suffix will be added."
  type        = string
  default = "sa_sh_"
}

variable "global_suffix" {
  description = "A unique suffix for naming resources, passed from the global configuration."
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account (e.g., Standard or Premium)."
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The replication type for the storage account (e.g., LRS, GRS, RAGRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "The access tier for the storage account, applicable only for blob storage (e.g., Hot or Cool)."
  type        = string
  default     = "Hot"
}

variable "tags" {
  description = "Tags to assign to the storage account."
  type        = map(string)
  default     = {}
}
