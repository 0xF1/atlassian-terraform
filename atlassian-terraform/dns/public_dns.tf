variable elb_rancher_public_dns_name {}

resource "aws_route53_record" "rancher-public" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "rancher"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.elb_rancher_public_dns_name}"]
}
