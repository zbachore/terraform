data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "spoke_rg" {
  name = var.resource_group_name
}

locals {
  env_code  = "dev"
  name_hash = substr(md5("${data.azurerm_client_config.current.subscription_id}-${data.azurerm_resource_group.spoke_rg.name}"), 0, 16)
  sa_name   = "st${local.env_code}${local.name_hash}"
}

resource "azurerm_storage_account" "spoke_sa" {
  name                = local.sa_name
  resource_group_name = data.azurerm_resource_group.spoke_rg.name
  location            = data.azurerm_resource_group.spoke_rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false


  tags = var.tags
}
