data "terraform_remote_state" "hub" {
  backend = "azurerm"
  config = {
    resource_group_name  = "ce-tfstate-rg"
    storage_account_name = "cetfstate001"
    container_name       = "tfstate"
    key                  = "caf/hub/terraform.tfstate"
  }
}

module "spoke" {
  source   = "../../modules/spoke"
  location = var.location
  tags     = var.tags

  lz_rg_name          = "ce-lz-d-rg"
  spoke_vnet_name     = "ce-spk-d-vnet"
  spoke_address_space = "10.1.0.0/16"

  app_subnet_name = "app-snet"
  app_subnet_cidr = "10.1.1.0/24"

  db_subnet_name = "db-snet"
  db_subnet_cidr = "10.1.2.0/24"
}

module "peering" {
  source = "../../modules/peering"

  hub_rg_name   = data.terraform_remote_state.hub.outputs.hub_rg_name
  hub_vnet_name = data.terraform_remote_state.hub.outputs.hub_vnet_name
  hub_vnet_id   = data.terraform_remote_state.hub.outputs.hub_vnet_id

  spoke_rg_name   = module.spoke.spoke_rg_name
  spoke_vnet_name = module.spoke.spoke_vnet_name
  spoke_vnet_id   = module.spoke.spoke_vnet_id

  hub_to_spoke_name = "ce-hub-to-spk-d-peer"
  spoke_to_hub_name = "ce-spk-d-to-hub-peer"
}
