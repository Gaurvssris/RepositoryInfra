output "application_security_groups" {
  value = { for k, v in azurerm_application_security_group.asg : k => v.id }
}