resource "aws_route_table" "rancher" {
    vpc_id = "${aws_vpc.rancher.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.rancher.id}"
    }

    tags {
        Name = "rtbRancher"
    }
}
