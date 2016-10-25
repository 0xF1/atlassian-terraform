resource "aws_instance" "atlassian_private_host_zoneA" {
    ami = "ami-06a9e075"
    instance_type = "m3.medium"
    availability_zone = "eu-west-1a"
    key_name = "phooper-aws"
    vpc_security_group_ids = ["${var.priSecGroupAtlassianId}"]
    subnet_id = "${var.private_subnet_zone_a_id}"
    
    tags {
        Name = "atlassian_private_host_zoneA"
    }


}

#resource "aws_instance" "atlassian_private_host_zoneB" {
#    ami = "ami-06a9e075"
#    instance_type = "m3.medium"
#    availability_zone = "eu-west-1b"
#    key_name = "phooper-aws"
#    vpc_security_group_ids = ["${var.priSecGroupAtlassianId}"]
#    subnet_id = "${var.private_subnet_zone_b_id}"
#    
#    tags {
#        Name = "atlassian_private_host_zoneB"
#    }
#
#}
#
#resource "aws_instance" "atlassian_private_host_zoneC" {
#    ami = "ami-06a9e075"
#    instance_type = "m3.medium"
#    availability_zone = "eu-west-1c"
#    key_name = "phooper-aws"
#    vpc_security_group_ids = ["${var.priSecGroupAtlassianId}"]
#    subnet_id = "${var.private_subnet_zone_c_id}"
#    
#    tags {
#        Name = "atlassian_private_host_zoneC"
#    }
#}

output "atlassian_private_host_zoneA_id" {
    value = "${aws_instance.atlassian_private_host_zoneA.id}"
}
