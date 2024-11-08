resource "azurerm_storage_account" "Stg " {
 
 name                     = "storageaccountname"
  resource_group_name      = "shubham"
  location                 = "Centrsl india"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}