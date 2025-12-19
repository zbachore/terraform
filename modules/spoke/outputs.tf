output "spoke_rg_name" { value = azurerm_resource_group.lz.name }
output "spoke_vnet_name" { value = azurerm_virtual_network.spoke.name }
output "spoke_vnet_id" { value = azurerm_virtual_network.spoke.id }

# ---------------------------
# Azure SQL (optional) outputs
# ---------------------------

output "sql_server_id" {
  description = "Resource ID of the Azure SQL logical server (if enabled)."
  value       = var.enable_sql ? azurerm_mssql_server.sql[0].id : null
}

output "sql_server_name" {
  description = "Name of the Azure SQL logical server (if enabled)."
  value       = var.enable_sql ? azurerm_mssql_server.sql[0].name : null
}

output "sql_database_name" {
  description = "Name of the Azure SQL database (if enabled)."
  value       = var.enable_sql ? azurerm_mssql_database.sqldb[0].name : null
}

