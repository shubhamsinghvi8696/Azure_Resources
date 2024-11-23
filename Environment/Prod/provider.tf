terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "8ddfe29c-6383-412d-865c-46457d64e3d6"
}
provider "random" {

}
