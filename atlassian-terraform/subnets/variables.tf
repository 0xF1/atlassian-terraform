variable "vpc_id"          {}

variable "public_subnet_zone_a_cidr_block" {
  description = "Public Subnet ZoneA CIDR"
  default = "10.0.1.0/24"
}

variable "public_subnet_zone_a_name" {
  description = "Public Subnet ZoneA NAME"
  default = "pubSubAtlassianZoneA"
}

variable "public_subnet_zone_b_cidr_block" {
  description = "Public Subnet ZoneB CIDR"
  default = "10.0.2.0/24"
}

variable "public_subnet_zone_b_name" {
  description = "Public Subnet ZoneB NAME"
  default = "pubSubAtlassianZoneB"
}

variable "public_subnet_zone_c_cidr_block" {
  description = "Public Subnet ZoneC CIDR"
  default = "10.0.3.0/24"
}

variable "public_subnet_zone_c_name" {
  description = "Public Subnet ZoneC NAME"
  default = "pubSubAtlassianZoneC"
}

variable "private_subnet_zone_a_cidr_block" {
  description = "Private Subnet ZoneA CIDR"
  default = "10.0.4.0/24"
}

variable "private_subnet_zone_a_name" {
  description = "Private Subnet ZoneA NAME"
  default = "priSubAtlassianZoneA"
}

variable "private_subnet_zone_b_cidr_block" {
  description = "Private Subnet ZoneB CIDR"
  default = "10.0.5.0/24"
}

variable "private_subnet_zone_b_name" {
  description = "Private Subnet ZoneB NAME"
  default = "priSubAtlassianZoneB"
}

variable "private_subnet_zone_c_cidr_block" {
  description = "Private Subnet ZoneC CIDR"
  default = "10.0.6.0/24"
}

variable "private_subnet_zone_c_name" {
  description = "Private Subnet ZoneC NAME"
  default = "priSubAtlassianZoneC"
}

