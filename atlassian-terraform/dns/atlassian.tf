resource "aws_route53_record" "bitbucket" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "bitbucket"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["bitbucket.atlassian.vocalinkatlassianstack.fastervl.com"]
}

resource "aws_route53_record" "confluence" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "confluence"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["confluence.atlassian.vocalinkatlassianstack.fastervl.com"]
}

resource "aws_route53_record" "jira" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "jira"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["jira.atlassian.vocalinkatlassianstack.fastervl.com"]
}

resource "aws_route53_record" "crowd" {
  zone_id = "Z4PKVG2H6HOI4"
  name = "crowd"
  type = "CNAME"
  ttl = "1"
  weighted_routing_policy {
    weight = 10
  }
  set_identifier = "test"
  records = ["crowd.atlassian.vocalinkatlassianstack.fastervl.com"]
}








