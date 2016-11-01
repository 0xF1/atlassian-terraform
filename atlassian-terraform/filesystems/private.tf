variable private_subnet_zone_a_id {}
variable private_subnet_zone_b_id {}
variable private_subnet_zone_c_id {}
variable priSecGroupRancherId   {}

resource "aws_efs_file_system" "rancher-private" {
  creation_token = "rancher-private"
  tags {
    Name = "efsRancherPrivate"
  }
}

resource "aws_efs_mount_target" "rancher-private-zoneA" {
  file_system_id = "${aws_efs_file_system.rancher-private.id}"
  subnet_id = "${var.private_subnet_zone_a_id}"
  security_groups = ["${var.priSecGroupRancherId}"]
}

resource "aws_efs_mount_target" "rancher-private-zoneB" {
  file_system_id = "${aws_efs_file_system.rancher-private.id}"
  subnet_id = "${var.private_subnet_zone_b_id}"
  security_groups = ["${var.priSecGroupRancherId}"]
}

resource "aws_efs_mount_target" "rancher-private-zoneC" {
  file_system_id = "${aws_efs_file_system.rancher-private.id}"
  subnet_id = "${var.private_subnet_zone_c_id}"
  security_groups = ["${var.priSecGroupRancherId}"]
}


output "aws_efs_mount_target_private_zone_a_dns_name" {
    value = "${aws_efs_mount_target.rancher-private-zoneA.dns_name}"
}

output "aws_efs_mount_target_private_zone_b_dns_name" {
    value = "${aws_efs_mount_target.rancher-private-zoneB.dns_name}"
}

output "aws_efs_mount_target_private_zone_c_dns_name" {
    value = "${aws_efs_mount_target.rancher-private-zoneC.dns_name}"
}

