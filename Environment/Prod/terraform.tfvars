mod_RG = {
  RG1 = {
    name     = "Git_Azure"
    location = "central india"

    tags = {
      Environment = "Production"
      Owner       = "Shubham Singhvi"
    }
  }
}

# mod_stg = {
#   Storage1 = {
#     name                = "azurestg69"
#     location            = "central india"
#     resource_group_name = "Git_Azure"

#   }
# }


# mod_network = {
#   Neteork1 = {
#     name                = "azure_git_Vnet"
#     resource_group_name = "Git_Azure"
#     location            = "central india"


#     VN_subnet = {
#       subnet1 = {
#         name             = "ubuntu_vm"
#         address_prefixes = ["10.0.1.0/24"]
#       }
#       subnet2 = {
#         name             = "windows_vm"
#         address_prefixes = ["10.0.2.0/24"]
#       }
#       subnet3 = {
#         name             = "AzureBastionSubnet"
#         address_prefixes = ["10.0.3.0/24"]
#       }

#     }

#   }
# }

# mod_bastion = {
#   Bastion1 = {
#     Subname = "AzureBastionSubnet"
#     resource_group_name = "Git_Azure"
#     virtual_network_name = "azure_git_Vnet"
#     Pip_name = "publicPip"
#     location = "central india"
#     bastion_name = "Azure_Git_bastion"
#   }
# }