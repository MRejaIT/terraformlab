output "win_pip_id_output" {
  value = azurerm_public_ip.winpip.id
}

output "linux_pip_id_output" {
  value = azurerm_public_ip.linuxpip.id
}