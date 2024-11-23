resource "azurerm_resource_group" "adv_rg" {
    for_each = var.RG_Variable
    name =  each.value.name
    location = each.value.location
    tags = each.value.tags
    managed_by = each.value.managed_by
}