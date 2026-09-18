output "network_security_groups" {
  value = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}