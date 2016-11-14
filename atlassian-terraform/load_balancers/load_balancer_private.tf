variable private_subnet_zone_a_id {}
variable private_subnet_zone_b_id {}
variable private_subnet_zone_c_id {}

resource "aws_elb" "rancher_private" {
  name = "elbRancherPrivate"
  subnets = ["${var.private_subnet_zone_a_id}", "${var.private_subnet_zone_b_id}", "${var.private_subnet_zone_c_id}"]
  security_groups = ["${var.pubSecGroupRancherId}"]
  internal = "true"

  listener {
    instance_port = 22
    instance_protocol = "tcp"
    lb_port = 80
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "tcp:22"
    interval = 30
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "elbRancherPrivate"
  }
}

output "elb_rancher_private" {
    value = "${aws_elb.rancher_private.id}"
}

output "elb_rancher_private_dns_name" {
    value = "${aws_elb.rancher_private.dns_name}"
}

