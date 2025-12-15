variable "location" { type = string }
variable "tags" { type = map(string) }

variable "lz_rg_name" { type = string }

variable "spoke_vnet_name" { type = string }
variable "spoke_address_space" { type = string }

variable "app_subnet_name" { type = string }
variable "app_subnet_cidr" { type = string }

variable "db_subnet_name" { type = string }
variable "db_subnet_cidr" { type = string }
