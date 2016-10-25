resource "aws_internet_gateway" "atlassian" {
    vpc_id = "${aws_vpc.atlassian.id}"

    tags {
        Name = "igwAtlassian"
    }

}
