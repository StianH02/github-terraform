terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_backend_sh"
    storage_account_name = "sabackendsh"
    container_name       = "tfstate"
    key                  = "deployments.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

data "terraform_remote_state" "global" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg_backend_sh"
    storage_account_name = "sabackendsh"
    container_name       = "tfstate"
    key                  = "global.terraform.tfstate"
  }
}

module "networking" {
  source              = "../modules/networking"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  global_suffix        = data.terraform_remote_state.global.outputs.global_suffix
  address_space       = var.address_space
  subnets             = var.subnets
  nsg_name            = var.nsg_name
}

module "app_service" {
  source                    = "../modules/app_service"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  global_suffix        = data.terraform_remote_state.global.outputs.global_suffix  
  app_service_plan_name     = var.app_service_plan_name
  app_service_plan_sku_name = var.app_service_plan_sku_name
  app_service_name          = var.app_service_name
}

module "database" {
  source                       = "../modules/database"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  global_suffix        = data.terraform_remote_state.global.outputs.global_suffix  
  sql_server_name              = var.sql_server_name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  database_name                = var.database_name
  collation                    = var.collation
  license_type                 = var.license_type
  max_size_gb                  = var.max_size_gb
  sku_name                     = var.sku_name
  enclave_type                 = var.enclave_type
  tags                         = var.tags
}

module "load_balancer" {
  source             = "../modules/load_balancer"
  location           = var.location
  public_ip_name     = var.public_ip_name
  global_suffix        = data.terraform_remote_state.global.outputs.global_suffix  
  load_balancer_name = var.load_balancer_name
  frontend_ip_name   = var.frontend_ip_name
}

module "storage" {
  source               = "../modules/storage"
  location             = var.location
  resource_group_name  = var.resource_group_name
  base_name            = var.base_name
  global_suffix        = data.terraform_remote_state.global.outputs.global_suffix  
  account_tier         = var.account_tier
  replication_type     = var.replication_type
  access_tier          = var.access_tier
  tags                 = var.tags
}
