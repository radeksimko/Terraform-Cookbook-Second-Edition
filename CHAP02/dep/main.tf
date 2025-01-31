terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rgdep"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = "West Europe"
  resource_group_name = "rgdep"
  address_space       = ["10.0.0.0/16"]

  depends_on = [azurerm_resource_group.rg]

}