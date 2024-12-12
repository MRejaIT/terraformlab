resource "azurerm_network_interface" "winnicdetails" {
  name                = var.win_nic_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.app_subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.win_pip_id
  }

  depends_on = [ var.app_subnetid ]
}

resource "azurerm_network_interface" "linuxnicdetails" {
  name                = var.linux_nic_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.db_subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.linux_pip_id
  }

  depends_on = [ var.db_subnetid ]
}