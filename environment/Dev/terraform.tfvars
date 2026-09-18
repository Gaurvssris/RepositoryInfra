resourcegroups = {
  "rg1" = {
    name     = "Dev-Rg"
    location = "Central US"
  }
}

acr = {
  "acr1" = {
    name                = "gssDevACR"
    resource_group_name = "Dev-Rg"
    location            = "Central US"
  }
}

akclusters = {
  "aks1" = {
    name                = "gssDevAKS"
    resource_group_name = "Dev-Rg"
    location            = "Central US"
    node_count          = 1
    vm_size             = "Standard_D2s_v3"
  }
}

vnets1 = {
  "vnet1" = {
    name                 = "gssDevVnet"
    resource_group_name  = "Dev-Rg"
    location             = "Central US"
    address_space        = ["10.0.0.0/16"]
  }
}

subnets1 = {
  "subnet1" = {
    name                  = "gssDevSubnet"
    resource_group_name   = "Dev-Rg"
    virtual_network_name  = "gssDevVnet"
    address_prefixes      = ["10.0.0.0/24"]
  }
  "subnet2" = {
    name                  = "gssDevSubnet2"
    resource_group_name   = "Dev-Rg"
    virtual_network_name  = "gssDevVnet"
    address_prefixes      = ["10.0.1.0/24"]
  }
}

nics1 = {
  "nic1" = {
    name                             = "gssDevNIC1"
    location                         = "Central US"
    resource_group_name              = "Dev-Rg"
    subnet_key                       = "subnet1"
    network_security_group_key       = "nsg1"
    application_security_group_key   = "asg1"
    backend_address_pool_key         = "backend_pool1"
  }
  "nic2" = {
    name                             = "gssDevNIC2"
    location                         = "Central US"
    resource_group_name              = "Dev-Rg"
    subnet_key                       = "subnet2"
    network_security_group_key       = "nsg1"
    application_security_group_key   = "asg1"
    backend_address_pool_key         = "backend_pool1"
  }
}

public_ips1 = {
  "public_ip1" = {
    name                 = "gssDevPublicIP"
    resource_group_name  = "Dev-Rg"
    location             = "Central US"
    allocation_method    = "Static"
  }
  "public_ip2" = {
    name                 = "gssDevPublicIP2"
    resource_group_name  = "Dev-Rg"
    location             = "Central US"
    allocation_method    = "Static"
  }
}

virtual_machines1 = {
  "vm1" = {
    name                 = "gssDevVM1"
    location             = "Central US"
    resource_group_name  = "Dev-Rg"
    size                 = "Standard_B2s"
    admin_username       = "azureadmin"
    admin_password       = "YourSecurePassword123!"
    nic_key              = "nic1"
  }
  "vm2" = {
    name                 = "gssDevVM2"
    location             = "Central US"
    resource_group_name  = "Dev-Rg"
    size                 = "Standard_B2s"
    admin_username       = "azureadmin"
    admin_password       = "YourSecurePassword123!"
    nic_key              = "nic2"
  }
}

application_security_groups1 = {
  "asg1" = {
    name                 = "gssDevASG"
    location             = "Central US"
    resource_group_name  = "Dev-Rg"
  }
}

network_security_groups1 = {
  "nsg1" = {
    name                 = "gssDevNSG"
    location             = "Central US"
    resource_group_name  = "Dev-Rg"
  }
}

load_balancers1 = {
  "lb1" = {
    name                 = "gssDevLB"
    location             = "Central US"
    resource_group_name  = "Dev-Rg"
    public_ip_key        = "public_ip1"
  }
}

backend_address_pools1 = {
  "backend_pool1" = {
    name                 = "gssDevBackendPool"
    location             = "Central US"
    resource_group_name  = "Dev-Rg"
    load_balancer_key    = "lb1"
  }
}