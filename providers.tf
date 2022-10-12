terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
  backend "local" {}
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  #client_id       = var.devops_spn_client_id
  #client_secret   = var.devops_spn_secret
  tenant_id = var.tenant_id
}

data "azurerm_client_config" "current" {}