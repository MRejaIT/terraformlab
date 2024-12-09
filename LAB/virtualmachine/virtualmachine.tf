resource "azurerm_windows_virtual_machine" "win-vm" {
  name                = var.windowsserver_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  size                = "Standard_B2als_v2"
  admin_username      = "azuser"
  admin_password      = "Asdf123456789"
  network_interface_ids = [  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
  depends_on = [ var.resourcegroup_name ]
}

resource "azurerm_managed_disk" "datadisk" {
  name                 = "datadisk01"
  location             = var.location
  resource_group_name  = var.resourcegroup_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 4

  depends_on = [ var.resourcegroup_name ]
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisklink" {
  managed_disk_id    = azurerm_managed_disk.datadisk.id
  virtual_machine_id = azurerm_windows_virtual_machine.win-vm.id
  lun                = "0"
  caching            = "ReadWrite"
}