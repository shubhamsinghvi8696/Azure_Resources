variable "var_Ubuntumachine" {

}

data "azurerm_subnet" "VM_Datasubnet" {
  for_each             = var.var_Ubuntumachine
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

}

data "azurerm_key_vault" "VM_Keyvault" {
  for_each            = var.var_Ubuntumachine
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_key_vault_secret" "username_secret" {
  for_each     = var.var_Ubuntumachine
  name         = "$(each.value.Ubuntu_VM_Name).vm"
  value        = each.value.VM_Name
  key_vault_id = data.azurerm_key_vault.VM_Keyvault[each.key].id
}

resource "random_password" "R_pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "username_password" {
  for_each     = var.var_Ubuntumachine
  name         = "$(each.value.Ubuntu_VM_Name)_Password"
  value        = random_password.R_pass[each.key].result
  key_vault_id = data.azurerm_key_vault.VM_Keyvault[each.key].id
}

resource "azurerm_network_interface" "NIC" {
  for_each            = var.var_Ubuntumachine
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_key_vault.VM_Keyvault[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "Ubuntu_VM" {
  for_each                        = var.var_Ubuntumachine
  name                            = each.value.Ubuntu_VM_Name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = "Standard_B1"
  admin_username                  = azurerm_key_vault_secret.username_password[each.key].value
  admin_password                  = azurerm_key_vault_secret.username_secret[each.key].value
  network_interface_ids           = [azurerm_network_interface.NIC[each.key].id]
  disable_password_authentication = false


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
