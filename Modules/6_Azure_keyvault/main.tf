variable "key_Vault" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "KeyVault_VM" {
  for_each                    = var.key_Vault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  enabled_for_disk_encryption = true
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
