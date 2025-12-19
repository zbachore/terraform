location            = "eastus"
resource_group_name = "ce-lz-d-rg"

tags = {
  Environment = "Dev"
  Owner       = "Zewdu"
  CostCenter  = "CAF-POC"
  Test        = "pipeline"
}

# ---------------------------
# Azure SQL (DEV)
# ---------------------------

enable_sql        = true
sql_server_name   = "ce-spk-d-sql-001"
sql_database_name = "appdb"
sql_admin_login   = "sqladmin"
sql_version       = "12.0"
sql_sku_name      = "GP_S_Gen5_2"
sql_location = "eastus2"
