
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.12.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.3"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-rajaalab-dev"
    storage_account_name = "st4atxqdwy5z"
    container_name       = "tfstate"
    key                  = "devops-dev"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "8b521544-a3c1-493d-ad92-9ee6c75a609c"
}
