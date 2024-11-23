module "Azure_Resource" {
  source = "../../Modules/1_Azure_Resource_Group"
  RG_Variable = var.mod_RG
}

# module "azure_storage" {
#   source = "../../Modules/2_Azure_Storage"
#   var_my_STG = var.mod_stg
# }

# module "Azure_Network" {
#   depends_on = [ module.Azure_Resource ]
#   source = "../../Modules/3_Azure_Network"
#   Var_Network =var.mod_network

  
# }
# module "Azure_bastion" {
#  depends_on = [ module.Azure_Network ]
#   source = "../../Modules/5_Azure_Bastions"
#   var_Bastion = var.mod_bastion
  
# }