resource "azurerm_public_ip" "winpip" {
  name                = var.win_pip_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  allocation_method   = "Static"

  depends_on = [var.resourcegroup_name]
}

resource "azurerm_public_ip" "linuxpip" {
  name                = var.linux_pip_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  allocation_method   = "Static"

  depends_on = [var.resourcegroup_name]
}