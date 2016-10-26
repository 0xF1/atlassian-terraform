variable priSecGroupAtlassianId {}

resource "aws_launch_configuration" "atlassian_private_configuration" {
    name = "atlassian_private_configuration"
    image_id = "ami-d41d58a7"
    instance_type = "m3.medium"

    security_groups = ["${var.priSecGroupAtlassianId}"]
    key_name        = "phooper-aws"

    associate_public_ip_address = "false"


}

