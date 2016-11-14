resource "aws_elb" "rancher_public" {
  name = "elbRancherPublic"
  subnets = ["${var.public_subnet_zone_a_id}", "${var.public_subnet_zone_b_id}", "${var.public_subnet_zone_c_id}"]
  security_groups = ["${var.pubSecGroupRancherId}"]

  listener {
    lb_port = 80
    lb_protocol = "tcp"
    instance_port = 81
    instance_protocol = "tcp"
  }

  listener {
    lb_port = 443
    lb_protocol = "ssl"
    instance_port = 81
    instance_protocol = "tcp"
    ssl_certificate_id = "arn:aws:acm:eu-west-1:702440161528:certificate/1734793d-035b-456c-b2a7-875a0efcafc3"
  }

  listener {
    lb_port = 8080
    lb_protocol = "http"
    instance_port = 8080
    instance_protocol = "http"
  }

  health_check {
    unhealthy_threshold = 2
    healthy_threshold = 2
    timeout = 3
    target = "tcp:22"
    interval = 30
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "elbRancherPublic"
  }
}

output "elb_rancher_public" {
    value = "${aws_elb.rancher_public.id}"
}

output "elb_rancher_public_dns_name" {
    value = "${aws_elb.rancher_public.dns_name}"
}


