resource "aws_main_route_table_association" "atlassian" {
    vpc_id = "${aws_vpc.atlassian.id}"
    route_table_id = "${aws_route_table.atlassian.id}"
}
