variable elb_rancher_private_dns_name {}

resource "aws_route53_record" "rancher-private" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "rancher-private"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.elb_rancher_private_dns_name}"]
}

