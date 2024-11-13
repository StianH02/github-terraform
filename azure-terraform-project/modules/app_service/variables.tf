variable "location" {
  description = "Azure region where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for app service resources."
  type        = string
}

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

variable "global_suffix" {
  description = "A unique suffix for naming resources, passed from the global configuration."
  type        = string
}