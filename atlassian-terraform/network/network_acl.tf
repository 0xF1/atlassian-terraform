resource "aws_network_acl" "rancher" {
    vpc_id = "${aws_vpc.rancher.id}"
    subnet_ids = ["${var.public_subnet_zone_a_id}", "${var.public_subnet_zone_b_id}", "${var.public_subnet_zone_c_id}"]
    egress {
        protocol = "all"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    ingress {
        protocol = "all"
        rule_no = "100"
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    tags {
        Name = "naclRancher"
    }
}
