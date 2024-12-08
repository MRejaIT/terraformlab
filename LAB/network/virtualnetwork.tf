resource "azurerm_virtual_network" "vnetname" {
  name                = var.vent_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
  address_space       = ["10.0.0.0/16"]

  depends_on = [ var.resourcegroup_name ]
}

resource "azurerm_subnet" "app_subnet" {
  name                 = var.app_subnet
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = var.vent_name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [ azurerm_virtual_network.vnetname ]
}


resource "azurerm_subnet" "db_subnet" {
  name                 = var.db_subnet
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = var.vent_name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [ azurerm_virtual_network.vnetname ]
}
