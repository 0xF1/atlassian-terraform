# ----------------------------------------------
# Create a VPC to launch our instances into
# ----------------------------------------------
resource "aws_vpc" "atlassian" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "${var.aws_vpc_name}"
  }
}

output "vpc_id" {
    value = "${aws_vpc.atlassian.id}"
}
