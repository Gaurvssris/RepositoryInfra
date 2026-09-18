# azurerm_publicip/output.tf
output "public_ips" {
  value = { for k, v in azurerm_public_ip.pip : k => v.id }
}