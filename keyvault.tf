resource "azurerm_key_vault" "demo" {
  name                        = "norell-demo-vault"
  location                    = azurerm_resource_group.demo.location
  resource_group_name         = azurerm_resource_group.demo.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  enable_rbac_authorization   = true
}

resource "azurerm_role_assignment" "keyvault_secrets" {
  scope                            = azurerm_key_vault.demo.id
  role_definition_name             = "Key Vault Secrets Officer"
  principal_id                     = var.user_id
  skip_service_principal_aad_check = false
}

resource "azurerm_key_vault_secret" "storage_access_key" {
  name         = "norell-demo-storage-key"
  value        = azurerm_storage_account.demo.primary_access_key
  key_vault_id = azurerm_key_vault.demo.id
  # Make sure you have access before attempting to make a key
  depends_on = [azurerm_role_assignment.keyvault_secrets]
}