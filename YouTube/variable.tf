variable "security_rules" {
    type = map(object({
        name = string
        priority = number
        destination_port_range = string
    }))

    default = {
      "rule1" = {
        name = "RDP-Allow"
        priority = 100
        destination_port_range = "3389"        
      },

      "rule2" = {
        name = "SSH-Allow"
        priority = 200
        destination_port_range = "22"        
      },

      "rule3" = {
        name = "HTTP-Allow"
        priority = 300
        destination_port_range = "80"        
      },

      "rule4" = {
        name = "HHTPS-Allow"
        priority = 400
        destination_port_range = "443"        
      }
    }
  
}
