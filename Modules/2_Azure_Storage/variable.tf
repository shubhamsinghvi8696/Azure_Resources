variable "var_my_STG" {
type = map(object({
  name = string
  location=string
  resource_group_name=string
}))
}