resource "azurerm_key_vault" "terraform_kv" { #rename to just azurerm_key_vault.terraform ?
  name                        = "terraform"
  location                    = azurerm_resource_group.terraform_rg.location
  resource_group_name         = azurerm_resource_group.terraform_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy { #Developer team
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge"
    ]
  }

  lifecycle {                                                                                    #Dev cannot change: soft_delete_retention_days, purge_protection_enabled
    ignore_changes = [tags, access_policy, soft_delete_retention_days, purge_protection_enabled] #AzureDatabricks access policy will be added after apply
  }

}