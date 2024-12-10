variable "resource_group_name" {
  description = "The name of the resource group in which to create the network interface."
  type        = string
}

variable "location" {
  description = "The location/region where the network interface is created."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to create the network interface."
  type        = string
}

variable "nsg_id" {
  description = "The ID of the network security group to associate with the network interface."
  type        = string
}
