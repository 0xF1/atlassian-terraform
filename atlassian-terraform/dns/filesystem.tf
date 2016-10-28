variable aws_efs_mount_target_private_zone_a_dns_name {}
variable aws_efs_mount_target_private_zone_b_dns_name {}
variable aws_efs_mount_target_private_zone_c_dns_name {}

resource "aws_route53_record" "filesystem_private_zone_a" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "filesystem_private_zone_a"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.aws_efs_mount_target_private_zone_a_dns_name}"]
}

resource "aws_route53_record" "filesystem_private_zone_b" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "filesystem_private_zone_b"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.aws_efs_mount_target_private_zone_b_dns_name}"]
}

resource "aws_route53_record" "filesystem_private_zone_c" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "filesystem_private_zone_c"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.aws_efs_mount_target_private_zone_c_dns_name}"]
}


