variable "Var_Network" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    
    VN_subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

resource "azurerm_virtual_network" "Azure_Network" {
  for_each            = var.Var_Network
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = ["10.0.0.1/16"]

  dynamic "subnet" {
    for_each = each.value.VN_subnet
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
