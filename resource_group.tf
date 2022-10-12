resource "azurerm_resource_group" "terraform_rg" { #Rename to just azurerm_resource_group.terraform ?
  name     = "terraform"                          # Would love to rename to terraform
  location = "westeurope"

  lifecycle {
    ignore_changes = [tags]
  }
}