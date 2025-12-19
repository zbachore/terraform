resource "azurerm_resource_group" "lz" {
  name     = var.lz_rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "spoke" {
  name                = var.spoke_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.lz.name
  address_space       = [var.spoke_address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "app" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.lz.name
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes     = [var.app_subnet_cidr]
}

resource "azurerm_subnet" "db" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.lz.name
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes     = [var.db_subnet_cidr]
}

# ---------------------------
# Azure SQL (optional)
# ---------------------------

resource "azurerm_mssql_server" "sql" {
  count               = var.enable_sql ? 1 : 0
  name                = var.sql_server_name
  resource_group_name = var.lz_rg_name
  location            = var.location
  version             = var.sql_version

  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  tags = var.tags
}

resource "azurerm_mssql_database" "sqldb" {
  count     = var.enable_sql ? 1 : 0
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql[0].id
  sku_name  = var.sql_sku_name

  tags = var.tags
}
