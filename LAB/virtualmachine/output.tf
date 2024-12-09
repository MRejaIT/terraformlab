output "windowsserver_name_output" {
  value = var.windowsserver_name
}

output "nic_id_output" {
  value = azurerm_network_interface.nicdetails.id
}