variable pubSecGroupRancherId {}

resource "aws_launch_configuration" "rancher_public_configuration" {
    name = "rancher_public_configuration"
    image_id = "ami-d1287ca2" # rancheros-rancher-server
    instance_type = "m3.medium"

    security_groups = ["${var.pubSecGroupRancherId}"]
    key_name        = "phooper-aws"

    #user_data       = "${file("userdata/bootstrap-rancher.sh")}"

    # Set this to false if internet access is NOT required from the instances in the ASG
    associate_public_ip_address = "true"

    root_block_device {
      volume_size = "30"
    }

    lifecycle {
      create_before_destroy = true
    }
}

