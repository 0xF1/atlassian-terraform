variable "public_subnet_zone_a_id"  {}
variable "public_subnet_zone_b_id"  {}
variable "public_subnet_zone_c_id"  {}
variable "private_subnet_zone_a_id" {}
variable "private_subnet_zone_b_id" {}
variable "private_subnet_zone_c_id" {}

variable "aws_vpc_name" {
  description = "AWS VPC name"
  default = "vpcRancher"
}

