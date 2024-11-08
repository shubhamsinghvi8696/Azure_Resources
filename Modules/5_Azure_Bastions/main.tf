 
variable "var_Bastion" {
  
}
data "azurerm_subnet" "data_subnet" {
    for_each = var.var_Bastion
     name = each.value.Subname
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.var_Bastion
  name                = each.value.Pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_bastion_host" "Bastion_git" {
      for_each            = var.var_Bastion
  name              = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}