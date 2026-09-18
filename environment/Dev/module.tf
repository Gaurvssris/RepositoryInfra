module "resource_groups" {
  source          = "../../azurerm_resource_group"
  resource_groups = var.resourcegroups
}

module "acr" {
  source     = "../../azurerm_acr"
  acrs       = var.acr
  depends_on = [module.resource_groups]
}

module "aks" {
  source              = "../../azurerm_aks"
  kubernetes_clusters = var.akclusters
  depends_on          = [module.resource_groups, module.acr]
}

module "vnet" {
  source      = "../../azurerm_vnet"
  vnets       = var.vnets1
  depends_on  = [module.resource_groups]
}

module "subnet" {
  source      = "../../azurerm_subnet"
  subnets     = var.subnets1
  depends_on  = [module.resource_groups, module.vnet]
}

locals {
  nics_final = {
    for k, v in var.nics1 : k => {
      name                            = v.name
      location                        = v.location
      resource_group_name             = v.resource_group_name
      subnet_id                       = module.subnet.subnet_ids[v.subnet_key]
      network_security_group_id       = module.nsg.network_security_groups[v.network_security_group_key]
      application_security_group_id   = module.asg.application_security_groups[v.application_security_group_key]
      backend_address_pool_id         = module.backend_pool.backend_address_pools[v.backend_address_pool_key]
    }
  }
}

module "nic" {
  source     = "../../azurerm_NIC"
  nics       = local.nics_final
  depends_on = [
    module.resource_groups,
    module.subnet,
    module.nsg,
    module.asg,
    module.backend_pool
  ]
}

module "public_ip" {
  source      = "../../azurerm_publicip"
  public_ips  = var.public_ips1
  depends_on  = [module.resource_groups]
}

locals {
  virtual_machines_final = {
    for k, v in var.virtual_machines1 : k => {
      name                   = v.name
      location               = v.location
      resource_group_name    = v.resource_group_name
      size                   = v.size
      admin_username         = v.admin_username
      admin_password         = v.admin_password
      network_interface_id   = module.nic.nic_ids[v.nic_key]
    }
  }
}

module "virtual_machine" {
  source            = "../../azurerm_vm"
  virtual_machines  = local.virtual_machines_final
  depends_on        = [module.resource_groups, module.nic, module.public_ip]
}

module "asg" {
  source                        = "../../azurerm_asg"
  application_security_groups   = var.application_security_groups1
  depends_on                    = [module.resource_groups]
}

module "nsg" {
  source                     = "../../azurerm_nsg"
  network_security_groups    = var.network_security_groups1
  depends_on                 = [module.resource_groups]
}

locals {
  load_balancers_final = {
    for k, v in var.load_balancers1 : k => {
      name                   = v.name
      location               = v.location
      resource_group_name    = v.resource_group_name
      public_ip_address_id   = module.public_ip.public_ips[v.public_ip_key]
    }
  }
}

module "lb" {
  source          = "../../azurerm_lb"
  load_balancers  = local.load_balancers_final
  depends_on      = [module.resource_groups, module.public_ip]
}

locals {
  backend_address_pools_final = {
    for k, v in var.backend_address_pools1 : k => {
      name                  = v.name
      location              = v.location
      resource_group_name   = v.resource_group_name
      load_balancer_id      = module.lb.load_balancers[v.load_balancer_key]
    }
  }
}

module "backend_pool" {
  source                 = "../../azurerm_backendpool"
  backend_address_pools  = local.backend_address_pools_final
  depends_on             = [module.resource_groups, module.lb]
}