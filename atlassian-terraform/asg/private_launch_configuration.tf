variable priSecGroupAtlassianId {}

resource "aws_launch_configuration" "atlassian_private_configuration" {
    name = "atlassian_private_configuration"
    image_id = "ami-085b107b"
    instance_type = "m3.medium"

    security_groups = ["${var.priSecGroupAtlassianId}"]
    key_name        = "phooper-aws"
    user_data       = "${file("userdata/mount_atlassian_private_filesystem.sh")}"

    associate_public_ip_address = "false"

}

