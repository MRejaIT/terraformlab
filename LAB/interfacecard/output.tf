output "win_nic_id_output" {
  value = azurerm_network_interface.winnicdetails.id
}

output "linux_nic_id_output" {
  value = azurerm_network_interface.linuxnicdetails.id
}