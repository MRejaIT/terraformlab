resource "azurerm_subnet" "subnet" {
  name                 = "app-subnet"
  resource_group_name  = local.azurerm_resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}