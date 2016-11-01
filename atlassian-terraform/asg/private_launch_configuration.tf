#variable priSecGroupRancherId {}
#
#resource "aws_launch_configuration" "rancher_private_configuration" {
#    name = "rancher_private_configuration"
#    image_id = "ami-b47c32c7"
#    instance_type = "m3.medium"
#
#    security_groups = ["${var.priSecGroupRancherId}"]
#    key_name        = "phooper-aws"
#    user_data       = "${file("userdata/mount_rancher_private_filesystem.sh")}"
#
#    associate_public_ip_address = "false"
#
#}
#
