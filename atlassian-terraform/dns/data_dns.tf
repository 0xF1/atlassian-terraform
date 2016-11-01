variable rds_tooling_dns_name {}

resource "aws_route53_record" "rancher-data" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "rancher-data"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.rds_tooling_dns_name}"]
}

