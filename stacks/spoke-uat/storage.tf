data "azurerm_client_config" "current" {}

locals {
  env_code  = "uat"
  name_hash = substr(md5("${data.azurerm_client_config.current.subscription_id}-${azurerm_resource_group.rg.name}"), 0, 16)
  sa_name   = "st${local.env_code}${local.name_hash}"
}

resource "azurerm_storage_account" "spoke_sa" {
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version            = "TLS1_2"
  enable_https_traffic_only  = true
  allow_blob_public_access   = false

  tags = var.tags
}
