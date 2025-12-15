resource "azurerm_resource_group" "plt_net" {
  name     = var.plt_net_rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "plt_sec" {
  name     = var.plt_sec_rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "plt_mgmt" {
  name     = var.plt_mgmt_rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.plt_net.name
  address_space       = [var.hub_address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "hub_fw" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.plt_net.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.hub_fw_subnet_cidr]
}

resource "azurerm_subnet" "hub_shared" {
  name                 = var.hub_shared_subnet_name
  resource_group_name  = azurerm_resource_group.plt_net.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.hub_shared_subnet_cidr]
}

resource "azurerm_subnet" "hub_gw" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.plt_net.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.hub_gw_subnet_cidr]
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.location
  resource_group_name = azurerm_resource_group.plt_mgmt.name
  sku                 = "PerGB2018"
  retention_in_days   = var.law_retention_in_days
  tags                = var.tags
}
