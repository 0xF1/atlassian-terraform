# ----------------------------------------------
# Specify the provider and access details
# ----------------------------------------------
provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

# ########################
# Build the VPC
# ########################

module "vpc" {
    source = "./vpc"
    public_subnet_zone_a_id = "${module.subnets.public_subnet_zone_a_id}"
    public_subnet_zone_b_id = "${module.subnets.public_subnet_zone_b_id}"
    public_subnet_zone_c_id = "${module.subnets.public_subnet_zone_c_id}"
    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"
}

module "subnets" {
    source = "./subnets"
    vpc_id = "${module.vpc.vpc_id}"
}

module "security_groups" {
    source = "./security_groups"
    vpc_id = "${module.vpc.vpc_id}"
}

module "instances" {
    source = "./instances"
    vpc_id = "${module.vpc.vpc_id}"
    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"
    public_subnet_zone_a_id = "${module.subnets.public_subnet_zone_a_id}"
    public_subnet_zone_b_id = "${module.subnets.public_subnet_zone_b_id}"
    public_subnet_zone_c_id = "${module.subnets.public_subnet_zone_c_id}"

    pubSecGroupAtlassianId = "${module.security_groups.pubSecGroupAtlassianId}"
    priSecGroupAtlassianId = "${module.security_groups.priSecGroupAtlassianId}"
}

module "asg" {
    source = "./asg"
    atlassian_private_host_zoneA_id = "${module.instances.atlassian_private_host_zoneA_id}"
    atlassian_public_host_zoneA_id = "${module.instances.atlassian_public_host_zoneA_id}"
 
}  
