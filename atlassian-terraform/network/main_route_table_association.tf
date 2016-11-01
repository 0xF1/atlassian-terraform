resource "aws_main_route_table_association" "rancher" {
    vpc_id = "${aws_vpc.rancher.id}"
    route_table_id = "${aws_route_table.rancher.id}"
}
