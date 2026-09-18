variable "virtual_machines" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    size                  = string
    admin_username        = string
    admin_password        = string
    network_interface_id  = string        # 👈 नई field add करें
  }))
}