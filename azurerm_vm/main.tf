resource "azurerm_windows_virtual_machine" "vm" {
  for_each = var.virtual_machines
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  network_interface_ids = [
    each.value.network_interface_id       # 👈 सिर्फ़ यही लाइन बदली है
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  computer_name              = each.value.name
  provision_vm_agent         = true
  
}

