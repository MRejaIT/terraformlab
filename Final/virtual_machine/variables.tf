variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "The location/region where the virtual machine is created."
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface to associate with the virtual machine."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the virtual machine."
  type        = string
}
