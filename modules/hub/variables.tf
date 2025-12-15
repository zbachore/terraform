variable "location" { type = string }
variable "tags" { type = map(string) }

variable "plt_net_rg_name" { type = string }
variable "plt_sec_rg_name" { type = string }
variable "plt_mgmt_rg_name" { type = string }

variable "hub_vnet_name" { type = string }
variable "hub_address_space" { type = string }

variable "hub_fw_subnet_cidr" { type = string }
variable "hub_shared_subnet_name" { type = string }
variable "hub_shared_subnet_cidr" { type = string }
variable "hub_gw_subnet_cidr" { type = string }

variable "law_name" { type = string }
variable "law_retention_in_days" { type = number }
