module "resource_groups" {
  source = "../../azurerm_resource_group"
  resource_groups = var.resourcegroups
}
module "acr" {
  source = "../../azurerm_acr"
acrs = var.acr
depends_on = [module.resource_groups]
}
module "aks" {
  source = "../../azurerm_aks"
  kubernetes_clusters = var.akclusters
  depends_on = [module.resource_groups, module.acr]
}