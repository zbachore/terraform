# ---------------------------
# General
# ---------------------------

variable "location" {
  description = "Azure region where the spoke resources will be deployed."
  type        = string
}

variable "tags" {
  description = "Common tags applied to all resources in the spoke."
  type        = map(string)
}

# ---------------------------
# Resource Group
# ---------------------------

variable "lz_rg_name" {
  description = "Name of the landing zone resource group for the spoke."
  type        = string
}

# ---------------------------
# Networking - Spoke VNet
# ---------------------------

variable "spoke_vnet_name" {
  description = "Name of the spoke virtual network."
  type        = string
}

variable "spoke_address_space" {
  description = "CIDR address space for the spoke virtual network."
  type        = string
}

# ---------------------------
# Networking - Application Subnet
# ---------------------------

variable "app_subnet_name" {
  description = "Name of the application subnet in the spoke VNet."
  type        = string
}

variable "app_subnet_cidr" {
  description = "CIDR range for the application subnet."
  type        = string
}

# ---------------------------
# Networking - Database Subnet
# ---------------------------

variable "db_subnet_name" {
  description = "Name of the database subnet in the spoke VNet."
  type        = string
}

variable "db_subnet_cidr" {
  description = "CIDR range for the database subnet."
  type        = string
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
  description = "Azure SQL admin login (do not use 'admin' or reserved names)."
  type        = string
  default     = null
}

variable "sql_admin_password" {
  description = "Azure SQL admin password. Pass via pipeline secret / TF_VAR_* (do not commit)."
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
  description = "Azure SQL Database SKU (example: GP_S_Gen5_2, S0, Basic)."
  type        = string
  default     = "GP_S_Gen5_2"
}
