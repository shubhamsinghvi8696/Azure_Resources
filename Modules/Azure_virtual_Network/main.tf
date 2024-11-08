resource "azurerm_virtual_network" "VN1" {
  name = "Vnet1"
  resource_group_name = "shubham"
  location = "Central india"
  address_space = [ "10.0.0.0/16"]
  
}