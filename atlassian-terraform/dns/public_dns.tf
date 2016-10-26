variable elb_atlassian_public_dns_name {}

resource "aws_route53_record" "atlassian-public" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "atlassian-public"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["${var.elb_atlassian_public_dns_name}"]
}
