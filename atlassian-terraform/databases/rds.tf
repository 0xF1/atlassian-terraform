variable data_subnet_zone_a_id {}
variable data_subnet_zone_b_id {}
variable data_subnet_zone_c_id {}

variable private_subnet_zone_a_id {}
variable private_subnet_zone_b_id {}
variable private_subnet_zone_c_id {}

variable dataSecGroupAtlassianId {}

resource "aws_db_instance" "tooling" {
  # Mysql needs at least a 5GB storage allocation
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7.11"
  identifier           = "rdstoolingdatabase"
  instance_class       = "db.t2.micro"
  # Change to false for production-eqsue environments
  skip_final_snapshot  = "true"
  name                 = "rdsToolingDatabase"
  username             = "root"
  password             = "rootroot"
  # Set to true for production
  multi_az             = "false"
  port                 = "3306"
  vpc_security_group_ids  = ["${var.dataSecGroupAtlassianId}"]
  apply_immediately    = "true"
  db_subnet_group_name = "${aws_db_subnet_group.tooling.name}"
  parameter_group_name = "default.mysql5.7"

  tags {
      Name = "rdsToolingDatabase"
  }

}

resource "aws_db_subnet_group" "tooling" {
    name = "rds_tooling_subnet"
    subnet_ids = ["${var.data_subnet_zone_a_id}", "${var.data_subnet_zone_b_id}", "${var.data_subnet_zone_c_id}", "${var.private_subnet_zone_a_id}", "${var.private_subnet_zone_b_id}", "${var.private_subnet_zone_c_id}" ]
    tags {
        Name = "rdsToolingSubnet"
    }

}

output "rds_tooling_dns_name" {
    value = "${aws_db_instance.tooling.address}"
}
