resource "azurerm_windows_virtual_machine" "example" {
  name                  = "example-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_id]
  size               = "Standard_DS1_v2"

  os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_windows_config {}

  data_disk {
    name            = "example-data-disk"
    lun             = 0
    caching         = "ReadOnly"
    create_option   = "Empty"
    disk_size_gb    = 1024
  }
}
