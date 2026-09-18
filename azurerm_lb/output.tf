output "load_balancers" {
  value = { for k, v in azurerm_lb.lb : k => v.id }
}