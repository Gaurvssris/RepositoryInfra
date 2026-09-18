output "backend_address_pools" {
  value = { for k, v in azurerm_lb_backend_address_pool.backend : k => v.id }
}