resource "aws_instance" "atlassian_public_host_zoneA" {
    ami = "ami-06a9e075"
    instance_type = "m3.medium"
    availability_zone = "eu-west-1a"
    key_name = "phooper-aws"
    vpc_security_group_ids = ["${var.pubSecGroupAtlassianId}"]
    subnet_id = "${var.public_subnet_zone_a_id}"
    associate_public_ip_address = "true"
    
    tags {
        Name = "atlassian_public_host_zoneA"
    }


}
#
#resource "aws_instance" "atlassian_public_host_zoneB" {
#    ami = "ami-06a9e075"
#    instance_type = "m3.medium"
#    availability_zone = "eu-west-1b"
#    key_name = "phooper-aws"
#    vpc_security_group_ids = ["${var.pubSecGroupAtlassianId}"]
#    subnet_id = "${var.public_subnet_zone_b_id}"
#    associate_public_ip_address = "true"
#    
#    tags {
#        Name = "atlassian_public_host_zoneB"
#    }
#
#}
#
#resource "aws_instance" "atlassian_public_host_zoneC" {
#    ami = "ami-06a9e075"
#    instance_type = "m3.medium"
#    availability_zone = "eu-west-1c"
#    key_name = "phooper-aws"
#    vpc_security_group_ids = ["${var.pubSecGroupAtlassianId}"]
#    subnet_id = "${var.public_subnet_zone_c_id}"
#    associate_public_ip_address = "true"
#    
#    tags {
#        Name = "atlassian_public_host_zoneC"
#    }
#
#}

output "atlassian_public_host_zoneA_id" {
    value = "${aws_instance.atlassian_public_host_zoneA.id}"
}
