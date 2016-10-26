variable public_subnet_zone_a_id {}
variable public_subnet_zone_b_id {}
variable public_subnet_zone_c_id {}

resource "aws_elb" "atlassian_public" {
  name = "elbAtlassianPublic"
  subnets = ["${var.public_subnet_zone_a_id}", "${var.public_subnet_zone_b_id}", "${var.public_subnet_zone_c_id}"]
  security_groups = ["${var.pubSecGroupAtlassianId}"]

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

  #instances = ["${aws_instance.foo.id}"]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "elbAtlassianPublic"
  }
}

output "elb_atlassian_public" {
    value = "${aws_elb.atlassian_public.id}"
}

output "elb_atlassian_public_dns_name" {
    value = "${aws_elb.atlassian_public.dns_name}"
}


