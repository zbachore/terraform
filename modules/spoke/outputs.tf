output "spoke_rg_name" { value = azurerm_resource_group.lz.name }
output "spoke_vnet_name" { value = azurerm_virtual_network.spoke.name }
output "spoke_vnet_id" { value = azurerm_virtual_network.spoke.id }
