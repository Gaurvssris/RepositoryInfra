resourcegroups = {
  "rg1" = {
    name     = "Prod-Rg"
    location = "Central US"
  }
}
acr = {
  "acr1" = {
    name                     = "gssProdACR"
    resource_group_name      = "Prod-Rg"
    location                 = "Central US"
  }
}
akclusters = {
  "aks1" = {
    name                = "gssProdAKS"
    resource_group_name = "Prod-Rg"
    location            = "Central US"
    node_count          = 1
    vm_size             = "Standard_D2s_v3"
  }
}