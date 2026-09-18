resource "azurerm_network_interface" "nic" {
  for_each             = var.nics
  name                 = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association" {
  for_each                  = var.nics                                   # 👈 अपना for_each ज़रूरी
  network_interface_id      = azurerm_network_interface.nic[each.key].id # 👈 azurerm_network_interface से लें
  network_security_group_id = each.value.network_security_group_id
}

resource "azurerm_network_interface_application_security_group_association" "asg_attach" {
  for_each                       = var.nics
  network_interface_id           = azurerm_network_interface.nic[each.key].id
  application_security_group_id  = each.value.application_security_group_id
}



resource "azurerm_network_interface_backend_address_pool_association" "lbattach" {
  for_each                 = var.nics
  network_interface_id     = azurerm_network_interface.nic[each.key].id
  ip_configuration_name    = "internal"                                   # 👈 ये line add करें
  backend_address_pool_id  = each.value.backend_address_pool_id
}