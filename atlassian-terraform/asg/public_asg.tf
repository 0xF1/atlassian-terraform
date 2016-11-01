variable public_subnet_zone_a_id {}
variable public_subnet_zone_b_id {}
variable public_subnet_zone_c_id {}
variable elb_rancher_publicId  {}

resource "aws_autoscaling_group" "rancher_public" {
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  name = "asgRancherPublic"
  max_size = "${var.image_capacity}"
  min_size = "${var.image_capacity}"
  health_check_grace_period = 120
  health_check_type = "ELB"
  desired_capacity = "${var.image_capacity}"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.rancher_public_configuration.name}"
  load_balancers = ["${var.elb_rancher_publicId}"]
  vpc_zone_identifier = ["${var.public_subnet_zone_a_id}", "${var.public_subnet_zone_b_id}", "${var.public_subnet_zone_c_id}"]
  default_cooldown = 120

  tag {
    key = "name"
    value = "asg_rancher_public_instance"
    propagate_at_launch = "true"
  }
}
