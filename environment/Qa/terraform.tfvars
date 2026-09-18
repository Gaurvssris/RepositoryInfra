resourcegroups = {
  "rg1" = {
    name     = "Qa-Rg"
    location = "West Europe"
  }
}
acr = {
  "acr1" = {
    name                     = "gssQaACR"
    resource_group_name      = "Qa-Rg"
    location                 = "West Europe"
  }
}
akclusters = {
  "aks1" = {
    name                = "gssQaAKS"
    resource_group_name = "Qa-Rg"
    location            = "West Europe"
    node_count          = 1
    vm_size             = "Standard_D2s_v3"
  }
}