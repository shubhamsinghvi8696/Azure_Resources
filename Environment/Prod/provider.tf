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
  subscription_id = "e5766e8c-a4a1-4302-8b95-bfc9e78dfe38"
}
provider "random" {

}
