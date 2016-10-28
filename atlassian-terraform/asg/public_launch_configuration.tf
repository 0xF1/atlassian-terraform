variable pubSecGroupAtlassianId {}

resource "aws_launch_configuration" "atlassian_public_configuration" {
    name = "atlassian_public_configuration"
    image_id = "ami-085b107b"
    instance_type = "m3.medium"

    security_groups = ["${var.pubSecGroupAtlassianId}"]
    key_name        = "phooper-aws"

    # Set this to false if internet access is NOT required from the instances in the ASG
    associate_public_ip_address = "true"

}

