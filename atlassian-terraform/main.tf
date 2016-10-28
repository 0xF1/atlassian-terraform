# ----------------------------------------------
# Specify the provider and access details
# ----------------------------------------------
provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

module "network" {
    source = "./network"
    public_subnet_zone_a_id = "${module.subnets.public_subnet_zone_a_id}"
    public_subnet_zone_b_id = "${module.subnets.public_subnet_zone_b_id}"
    public_subnet_zone_c_id = "${module.subnets.public_subnet_zone_c_id}"
    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"
}

module "subnets" {
    source = "./subnets"
    vpc_id = "${module.network.vpc_id}"
}

module "security_groups" {
    source = "./security_groups"
    vpc_id = "${module.network.vpc_id}"
}

module "load_balancers" {
    source = "./load_balancers"
    public_subnet_zone_a_id = "${module.subnets.public_subnet_zone_a_id}"
    public_subnet_zone_b_id = "${module.subnets.public_subnet_zone_b_id}"
    public_subnet_zone_c_id = "${module.subnets.public_subnet_zone_c_id}"
    pubSecGroupAtlassianId = "${module.security_groups.pubSecGroupAtlassianId}"

    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"
    #priSecGroupAtlassianId = "${module.security_groups.priSecGroupAtlassianId}"
}

module "asg" {
    source = "./asg"
    vpc_id = "${module.network.vpc_id}"

    public_subnet_zone_a_id = "${module.subnets.public_subnet_zone_a_id}"
    public_subnet_zone_b_id = "${module.subnets.public_subnet_zone_b_id}"
    public_subnet_zone_c_id = "${module.subnets.public_subnet_zone_c_id}"

    pubSecGroupAtlassianId = "${module.security_groups.pubSecGroupAtlassianId}"

    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"

    priSecGroupAtlassianId = "${module.security_groups.priSecGroupAtlassianId}"

    elb_atlassian_publicId = "${module.load_balancers.elb_atlassian_public}"
    elb_atlassian_privateId = "${module.load_balancers.elb_atlassian_private}"

}  

module "dns" {
    source = "./dns"
    elb_atlassian_public_dns_name = "${module.load_balancers.elb_atlassian_public_dns_name}"
    elb_atlassian_private_dns_name = "${module.load_balancers.elb_atlassian_private_dns_name}"
    
    rds_tooling_dns_name = "${module.databases.rds_tooling_dns_name}"

    aws_efs_mount_target_private_zone_a_dns_name = "${module.filesystems.aws_efs_mount_target_private_zone_a_dns_name}"
    aws_efs_mount_target_private_zone_b_dns_name = "${module.filesystems.aws_efs_mount_target_private_zone_b_dns_name}"
    aws_efs_mount_target_private_zone_c_dns_name = "${module.filesystems.aws_efs_mount_target_private_zone_c_dns_name}"
}

module "databases" {
    source = "./databases"

    dataSecGroupAtlassianId = "${module.security_groups.dataSecGroupAtlassianId}"

    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"

    data_subnet_zone_a_id = "${module.subnets.data_subnet_zone_a_id}"
    data_subnet_zone_b_id = "${module.subnets.data_subnet_zone_b_id}"
    data_subnet_zone_c_id = "${module.subnets.data_subnet_zone_c_id}"
}

module "filesystems" {
    source = "./filesystems"

    private_subnet_zone_a_id = "${module.subnets.private_subnet_zone_a_id}"
    private_subnet_zone_b_id = "${module.subnets.private_subnet_zone_b_id}"
    private_subnet_zone_c_id = "${module.subnets.private_subnet_zone_c_id}"

    priSecGroupAtlassianId = "${module.security_groups.priSecGroupAtlassianId}"

}
