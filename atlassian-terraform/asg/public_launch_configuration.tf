variable pubSecGroupAtlassianId {}

resource "aws_launch_configuration" "atlassian_public_configuration" {
    name = "atlassian_public_configuration"
    image_id = "ami-d41d58a7"
    instance_type = "m3.medium"

    security_groups = ["${var.pubSecGroupAtlassianId}"]
    key_name        = "phooper-aws"

    #associate_public_ip_address = "true"


}

