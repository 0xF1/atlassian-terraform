variable private_subnet_zone_a_id {}
variable private_subnet_zone_b_id {}
variable private_subnet_zone_c_id {}
variable priSecGroupAtlassianId   {}

resource "aws_efs_file_system" "atlassian-private" {
  creation_token = "atlassian-private"
  tags {
    Name = "efsAtlassianPrivate"
  }
}

resource "aws_efs_mount_target" "atlassian-private-zoneA" {
  file_system_id = "${aws_efs_file_system.atlassian-private.id}"
  subnet_id = "${var.private_subnet_zone_a_id}"
  security_groups = ["${var.priSecGroupAtlassianId}"]
}

resource "aws_efs_mount_target" "atlassian-private-zoneB" {
  file_system_id = "${aws_efs_file_system.atlassian-private.id}"
  subnet_id = "${var.private_subnet_zone_b_id}"
  security_groups = ["${var.priSecGroupAtlassianId}"]
}

resource "aws_efs_mount_target" "atlassian-private-zoneC" {
  file_system_id = "${aws_efs_file_system.atlassian-private.id}"
  subnet_id = "${var.private_subnet_zone_c_id}"
  security_groups = ["${var.priSecGroupAtlassianId}"]
}


output "aws_efs_mount_target_private_zone_a_dns_name" {
    value = "${aws_efs_mount_target.atlassian-private-zoneA.dns_name}"
}

output "aws_efs_mount_target_private_zone_b_dns_name" {
    value = "${aws_efs_mount_target.atlassian-private-zoneB.dns_name}"
}

output "aws_efs_mount_target_private_zone_c_dns_name" {
    value = "${aws_efs_mount_target.atlassian-private-zoneC.dns_name}"
}

