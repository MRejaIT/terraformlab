resource "azurerm_virtual_network" "vnet" {
  name                = "VNet-01"
  location            = local.location
  resource_group_name = local.azurerm_resource_group
  address_space       = ["10.0.0.0/16"]

  depends_on = [azurerm_resource_group.rgdetails]
}