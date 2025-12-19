variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

# ---------------------------
# Azure SQL (optional)
# ---------------------------

variable "enable_sql" {
  description = "If true, deploy an Azure SQL Server + Database in this spoke."
  type        = bool
  default     = false
}

variable "sql_server_name" {
  description = "Azure SQL logical server name. Must be globally unique in Azure."
  type        = string
  default     = null
}

variable "sql_database_name" {
  description = "Azure SQL database name."
  type        = string
  default     = "appdb"
}

variable "sql_admin_login" {
  description = "Azure SQL admin login."
  type        = string
  default     = null
}

variable "sql_admin_password" {
  description = "Azure SQL admin password. Provide securely (do not commit)."
  type        = string
  sensitive   = true
  default     = null
}

variable "sql_version" {
  description = "Azure SQL logical server version."
  type        = string
  default     = "12.0"
}

variable "sql_sku_name" {
  description = "Azure SQL Database SKU."
  type        = string
  default     = "GP_S_Gen5_2"
}

variable "sql_location" {
  description = "Azure region for Azure SQL resources in this stack."
  type        = string
  default     = null
}
