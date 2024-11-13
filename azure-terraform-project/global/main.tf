terraform {
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
    key                  = "global.terraform.tfstate"
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

resource "random_string" "global_suffix" {
  length  = 5
  special = false
  upper   = false
}