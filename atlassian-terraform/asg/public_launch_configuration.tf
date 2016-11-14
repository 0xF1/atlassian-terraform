variable pubSecGroupRancherId {}

resource "aws_launch_configuration" "rancher_public_configuration" {
    name = "rancher_public_configuration"
    image_id = "ami-43461030"
    instance_type = "m4.xlarge"

    security_groups = ["${var.pubSecGroupRancherId}"]
    key_name        = "phooper-aws"

    #user_data       = "${file("userdata/bootstrap-rancher.sh")}"
    #user_data       = "${file("userdata/rancher_host_cloud_config.yml")}"

    # Set this to false if internet access is NOT required from the instances in the ASG
    associate_public_ip_address = "true"

    root_block_device {
        delete_on_termination = true
        volume_type = "gp2"
        volume_size = 30
    }

    lifecycle {
      create_before_destroy = true
    }
}

