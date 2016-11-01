variable "vpc_id"          {}

variable "public_subnet_zone_a_cidr_block" {
  description = "Public Subnet ZoneA CIDR"
  default = "10.0.1.0/24"
}

variable "public_subnet_zone_a_name" {
  description = "Public Subnet ZoneA NAME"
  default = "pubSubRancherZoneA"
}

variable "public_subnet_zone_b_cidr_block" {
  description = "Public Subnet ZoneB CIDR"
  default = "10.0.2.0/24"
}

variable "public_subnet_zone_b_name" {
  description = "Public Subnet ZoneB NAME"
  default = "pubSubRancherZoneB"
}

variable "public_subnet_zone_c_cidr_block" {
  description = "Public Subnet ZoneC CIDR"
  default = "10.0.3.0/24"
}

variable "public_subnet_zone_c_name" {
  description = "Public Subnet ZoneC NAME"
  default = "pubSubRancherZoneC"
}

variable "private_subnet_zone_a_cidr_block" {
  description = "Private Subnet ZoneA CIDR"
  default = "10.0.4.0/24"
}

variable "private_subnet_zone_a_name" {
  description = "Private Subnet ZoneA NAME"
  default = "priSubRancherZoneA"
}

variable "private_subnet_zone_b_cidr_block" {
  description = "Private Subnet ZoneB CIDR"
  default = "10.0.5.0/24"
}

variable "private_subnet_zone_b_name" {
  description = "Private Subnet ZoneB NAME"
  default = "priSubRancherZoneB"
}

variable "private_subnet_zone_c_cidr_block" {
  description = "Private Subnet ZoneC CIDR"
  default = "10.0.6.0/24"
}

variable "private_subnet_zone_c_name" {
  description = "Private Subnet ZoneC NAME"
  default = "priSubRancherZoneC"
}

variable "data_subnet_zone_a_cidr_block" {
  description = "Data Subnet ZoneA CIDR"
  default = "10.0.7.0/24"
}

variable "data_subnet_zone_a_name" {
  description = "Data Subnet ZoneA NAME"
  default = "dataSubRancherZoneA"
}

variable "data_subnet_zone_b_cidr_block" {
  description = "Data Subnet ZoneB CIDR"
  default = "10.0.8.0/24"
}

variable "data_subnet_zone_b_name" {
  description = "Data Subnet ZoneB NAME"
  default = "dataSubRancherZoneB"
}

variable "data_subnet_zone_c_cidr_block" {
  description = "Data Subnet ZoneC CIDR"
  default = "10.0.9.0/24"
}

variable "data_subnet_zone_c_name" {
  description = "Data Subnet ZoneC NAME"
  default = "dataSubRancherZoneC"
}

