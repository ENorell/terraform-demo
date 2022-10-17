resource "azurerm_storage_account" "demo" {
  name                = "norelldemostorage"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.demo.name

  account_replication_type = "LRS"
  account_tier             = "Standard"
  min_tls_version          = "TLS1_2"

  is_hns_enabled            = false
  enable_https_traffic_only = true
  allow_blob_public_access  = false
  shared_access_key_enabled = true

  routing {
    publish_internet_endpoints  = false
    publish_microsoft_endpoints = false
    choice                      = "MicrosoftRouting"
  }
}

resource "azurerm_storage_container" "demo" {
  name                  = "norell-demo-container"
  storage_account_name  = azurerm_storage_account.demo.name
  container_access_type = "private"
}