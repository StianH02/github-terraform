variable "location" {
  description = "The Azure region where the load balancer and its resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the load balancer resources."
  type        = string
  default     = "lb_rg"
}

variable "public_ip_name" {
  description = "Name of the public IP address for the load balancer."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the load balancer."
  type        = string
}

variable "frontend_ip_name" {
  description = "Name of the frontend IP configuration for the load balancer."
  type        = string
}

variable "global_suffix" {
  description = "A unique suffix for naming resources, passed from the global configuration."
  type        = string
}