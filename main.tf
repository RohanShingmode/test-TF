terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.41.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "statefile-rg"
      storage_account_name = "terraformbackendsa12"
      container_name       = "terraform-state"
      key                  = "terraform.tfstate"
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
  subscription_id = "6da59885-4969-4932-a777-e29f9bb4c2de"
  features {

  }
}

resource "azurerm_resource_group" "existing" {
  name = "AIML" 
  location = "centralindia"
}

resource "azurerm_storage_account" "example" {
  name                     = "spiderman2025"
  resource_group_name      = azurerm_resource_group.existing.name
  location                 = azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

