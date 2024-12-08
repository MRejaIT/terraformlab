resource "azurerm_network_security_group" "nsgdetails" {
  name                = "AppNSG-01"
  location            = local.location
  resource_group_name = local.azurerm_resource_group

  security_rule {
    name                       = "Allow-RDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [ azurerm_resource_group.rgdetails ]
}