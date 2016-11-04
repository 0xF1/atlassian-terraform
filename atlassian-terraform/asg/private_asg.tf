variable private_subnet_zone_a_id {}
variable private_subnet_zone_b_id {}
variable private_subnet_zone_c_id {}
variable elb_rancher_privateId  {}
#
#
#resource "aws_autoscaling_group" "rancher_private" {
#  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#  name = "asgRancherPrivate"
#  max_size = "3"
#  min_size = "3"
#  health_check_grace_period = 120
#  health_check_type = "ELB"
#  desired_capacity = "3"
#  force_delete = true
#  launch_configuration = "${aws_launch_configuration.rancher_private_configuration.name}"
#  load_balancers = ["${var.elb_rancher_privateId}"]
#  vpc_zone_identifier = ["${var.private_subnet_zone_a_id}", "${var.private_subnet_zone_b_id}", "${var.private_subnet_zone_c_id}"]
#  default_cooldown = 120
#
#  tag {
#    key = "name"
#    value = "asg_rancher_private_instance"
#    propagate_at_launch = true
#  }
#}
