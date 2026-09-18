variable "nics" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    subnet_id                       = string
    network_security_group_id       = string
    application_security_group_id   = string
    backend_address_pool_id         = string
  }))
}