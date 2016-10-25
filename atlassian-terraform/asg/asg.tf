variable atlassian_private_host_zoneA_id {}
variable atlassian_public_host_zoneA_id {}


resource "aws_elb" "atlassian-elb" {
  name = "atlassian-frontend-lb"

  # The same availability zone as our instances
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  listener {
    instance_port     = 22
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances = ["${atlassian_public_host_zoneA_id}"]

}
