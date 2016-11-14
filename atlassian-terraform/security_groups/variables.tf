variable vpc_id {}

variable "rancher_subnet" {
  description = "Subnet of the Rancher Environment"
  default = "10.42.0.0/16"
}

variable "rfc1918_subnet" {
  description = "Subnet of the Rancher Environment"
  default = "172.16.0.0/12"
}



