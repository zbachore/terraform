output "hub_rg_name" { value = azurerm_resource_group.plt_net.name }
output "hub_vnet_name" { value = azurerm_virtual_network.hub.name }
output "hub_vnet_id" { value = azurerm_virtual_network.hub.id }
