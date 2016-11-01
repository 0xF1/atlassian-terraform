resource "aws_internet_gateway" "rancher" {
    vpc_id = "${aws_vpc.rancher.id}"

    tags {
        Name = "igwRancher"
    }

}
