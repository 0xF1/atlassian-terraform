variable priSecGroupRancherId {}

resource "aws_launch_configuration" "rancher_private_configuration" {
    name = "rancher_private_configuration"
    image_id = "ami-ab3a6bd8"
    instance_type = "t2.medium"

    security_groups = ["${var.priSecGroupRancherId}"]
    key_name        = "phooper-aws"
    user_data       = "${file("userdata/mount_atlassian_private_filesystem.sh")}"

    associate_public_ip_address = "true"

}

