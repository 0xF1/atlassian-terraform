resource "aws_route_table_association" "pubZoneA" {
    subnet_id = "${var.public_subnet_zone_a_id}"
    route_table_id = "${aws_route_table.atlassian.id}"
    depends_on = ["aws_network_acl.atlassian"]
}

resource "aws_route_table_association" "pubZoneB" {
    subnet_id = "${var.public_subnet_zone_b_id}"
    route_table_id = "${aws_route_table.atlassian.id}"
    depends_on = ["aws_network_acl.atlassian"]
}

resource "aws_route_table_association" "pubZoneC" {
    subnet_id = "${var.public_subnet_zone_c_id}"
    route_table_id = "${aws_route_table.atlassian.id}"
    depends_on = ["aws_network_acl.atlassian"]
}

resource "aws_route_table_association" "priZoneA" {
    subnet_id = "${var.private_subnet_zone_a_id}"
    route_table_id = "${aws_route_table.atlassian.id}"
    depends_on = ["aws_network_acl.atlassian"]
}

resource "aws_route_table_association" "priZoneB" {
    subnet_id = "${var.private_subnet_zone_b_id}"
    route_table_id = "${aws_route_table.atlassian.id}"
    depends_on = ["aws_network_acl.atlassian"]
}

resource "aws_route_table_association" "priZoneC" {
    subnet_id = "${var.private_subnet_zone_c_id}"
    route_table_id = "${aws_route_table.atlassian.id}"
    depends_on = ["aws_network_acl.atlassian"]
}
