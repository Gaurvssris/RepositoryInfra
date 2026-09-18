resource "azurerm_lb_backend_address_pool" "backend" {
  for_each        = var.backend_address_pools
  name            = each.value.name
  loadbalancer_id = each.value.load_balancer_id
}