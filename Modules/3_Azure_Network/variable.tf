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
