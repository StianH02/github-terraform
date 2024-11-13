variable "location" {
  description = "The Azure region where the SQL resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the SQL resources will be deployed."
  type        = string
}

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
  description = "SKU name for the SQL Database (e.g., S0, S1, etc.)."
  type        = string
  default     = "S0"
}

variable "enclave_type" {
  description = "Enclave type for the SQL Database (e.g., VBS)."
  type        = string
  default     = "VBS"
}

variable "tags" {
  description = "Tags to assign to the SQL Database."
  type        = map(string)
  default     = {}
}

variable "global_suffix" {
  description = "A unique suffix for naming resources, passed from the global configuration."
  type        = string
}