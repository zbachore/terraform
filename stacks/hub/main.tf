module "hub" {
  source   = "../../modules/hub"
  location = var.location
  tags     = var.tags

  plt_net_rg_name  = "ce-plt-net-rg"
  plt_sec_rg_name  = "ce-plt-sec-rg"
  plt_mgmt_rg_name = "ce-plt-mgmt-rg"

  hub_vnet_name          = "ce-hub-vnet"
  hub_address_space      = "10.0.0.0/16"
  hub_fw_subnet_cidr     = "10.0.1.0/24"
  hub_shared_subnet_name = "shared-snet"
  hub_shared_subnet_cidr = "10.0.2.0/24"
  hub_gw_subnet_cidr     = "10.0.255.0/27"

  law_name              = "ce-plt-law"
  law_retention_in_days = 30
}
