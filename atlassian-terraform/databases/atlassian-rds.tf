resource "aws_db_instance" "atlassian" {
  # Mysql needs at least a 5GB storage allocation
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "9.5.4"
  identifier           = "rdsatlassiandatabase"
  instance_class       = "db.m4.xlarge"
  # Change to false for production-eqsue environments
  skip_final_snapshot  = "true"
  name                 = "atlassian"
  username             = "root"
  #password             = "rootroot"
  # Set to true for production
  multi_az             = "false"
  port                 = "5432"
  vpc_security_group_ids  = ["${var.dataSecGroupRancherId}"]
  apply_immediately    = "true"
  snapshot_identifier  = "production-crowd-and-jira"
  db_subnet_group_name = "${aws_db_subnet_group.atlassian.name}"
  final_snapshot_identifier = "final-snapshot-atlassian"

  tags {
      Name = "rdsAtlassianDatabase"
  }

}

resource "aws_db_subnet_group" "atlassian" {
    name = "rds_atlassian_subnet"
    subnet_ids = [ "${var.public_subnet_zone_a_id}", "${var.public_subnet_zone_b_id}", "${var.public_subnet_zone_c_id}", "${var.data_subnet_zone_a_id}", "${var.data_subnet_zone_b_id}", "${var.data_subnet_zone_c_id}", "${var.private_subnet_zone_a_id}", "${var.private_subnet_zone_b_id}", "${var.private_subnet_zone_c_id}" ]
    tags {
        Name = "rdsAtlassianSubnet"
    }
}

output "rds_atlassian_dns_name" {
    value = "${aws_db_instance.atlassian.address}"
}
