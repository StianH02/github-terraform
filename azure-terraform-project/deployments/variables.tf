# General
variable "location" {
  description = "Azure region where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for networking resources."
  type        = string
}

# Network
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
  default     = "sh-nsg"
}

# App Service
variable "app_service_plan_name" {
  description = "Name of the App Service Plan."
  type        = string
}

variable "app_service_plan_sku_name" {
  description = "SKU name of the App Service Plan (e.g., B1, P1v2, S1)."
  type        = string
  default     = "P1v2"
}

variable "app_service_name" {
  description = "Name of the App Service (Linux Web App)."
  type        = string
}

# Database
variable "sql_server_name" {
  description = "Name of the SQL Server."
  type        = string
}

variable "administrator_login" {
  description = "Administrator username for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "Administrator password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the SQL Database."
  type        = string
}

variable "collation" {
  description = "Collation of the SQL Database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "license_type" {
  description = "License type for the SQL Database."
  type        = string
  default     = "LicenseIncluded"
}

variable "max_size_gb" {
  description = "Maximum size of the SQL Database in GB."
  type        = number 
  default     = 2
}

variable "sku_name" {
  description = "SKU name for the SQL Database, indicating the pricing tier."
  type        = string
  default     = "S0"
}

variable "enclave_type" {
  description = "Enclave type for the SQL Database."
  type        = string
  default     = "VBS"
}

variable "tags" {
  description = "Tags to assign to the SQL Database."
  type        = map(string)
  default     = {}
}

variable "public_ip_name" {
  description = "The name of the Public IP address to be used by the Load Balancer."
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the Load Balancer."
  type        = string
}

variable "frontend_ip_name" {
  description = "The name of the frontend IP configuration for the Load Balancer."
  type        = string
}

# Storage
variable "base_name" {
  description = "The base name of the Azure Storage Account."
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
  default     = "GRS" 
}

variable "access_tier" {
  description = "The access tier for the storage account, applicable only for blob storage (e.g., Hot or Cool)."
  type        = string
  default     = "Hot"
}
