variable "resourcegroups" {}
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

variable "vnets1" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    address_space        = list(string)
  }))
}

variable "subnets1" {
  type = map(object({
    name                  = string
    resource_group_name   = string
    virtual_network_name  = string
    address_prefixes      = list(string)
  }))
}

variable "nics1" {
  type = map(object({
    name                             = string
    location                         = string
    resource_group_name              = string
    subnet_key                       = string
    network_security_group_key       = string
    application_security_group_key   = string
    backend_address_pool_key         = string
  }))
}

variable "public_ips1" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

variable "application_security_groups1" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "network_security_groups1" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "load_balancers1" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    public_ip_key        = string
  }))
}

variable "backend_address_pools1" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    load_balancer_key    = string
  }))
}

variable "virtual_machines1" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    size                  = string
    admin_username        = string
    admin_password        = string
    nic_key               = string
  }))
}