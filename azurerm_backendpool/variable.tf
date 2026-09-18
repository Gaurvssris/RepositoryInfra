variable "backend_address_pools" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    load_balancer_id     = string
  }))
}