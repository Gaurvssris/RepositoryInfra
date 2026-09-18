variable "resourcegroups"{}
variable "acr" {}
variable "akclusters" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    node_count          = number
    vm_size             = string
  }))
}