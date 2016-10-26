resource "aws_route_table" "atlassian" {
    vpc_id = "${aws_vpc.atlassian.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.atlassian.id}"
    }

    tags {
        Name = "rtbAtlassian"
    }
}
