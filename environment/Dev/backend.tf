terraform {
  backend "azurerm" {
    resource_group_name  = "GssRG"
    storage_account_name = "gssstrg"
    container_name       = "gsscontainer"
    key                  = "dev.terraform.tfstate"
  }
}