resource "azurerm_network_security_rule" "nsg_rule" {

    for_each = {for rule in var.security_rules : rule.name => rule}
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = "Intbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.azurerm_resource_group
  network_security_group_name = azurerm_network_security_group.nsgdetails.name
} 