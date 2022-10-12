resource "azurerm_storage_account" "terraform_sa" {
  name                = "terraform"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.terraform_rg.name

  account_replication_type = "LRS"
  account_tier             = "Standard"
  #account_kind             = "StorageV2"
  min_tls_version = "TLS1_2"

  is_hns_enabled            = false
  enable_https_traffic_only = true
  allow_blob_public_access  = false
  shared_access_key_enabled = true

  routing {
    publish_internet_endpoints  = false
    publish_microsoft_endpoints = false
    choice                      = "MicrosoftRouting"
  }

  lifecycle {
    ignore_changes = [tags]
  }

}

resource "azurerm_storage_container" "terraform_ct" {
  name                  = "terraform-ct"
  storage_account_name  = azurerm_storage_account.terraform_sa.name
  container_access_type = "private"
}