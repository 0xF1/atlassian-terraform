# -------------------------------------
# Create zone isolated public subnets
#--------------------------------------
resource "aws_subnet" "public_subnet_zone_a" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnet_zone_a_cidr_block}"
  availability_zone       = "eu-west-1a"
  tags {
      Name = "${var.public_subnet_zone_a_name}"
  }
}

resource "aws_subnet" "public_subnet_zone_b" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnet_zone_b_cidr_block}"
  availability_zone       = "eu-west-1b"
  tags {
      Name = "${var.public_subnet_zone_b_name}"
  }
}

resource "aws_subnet" "public_subnet_zone_c" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnet_zone_c_cidr_block}"
  availability_zone       = "eu-west-1c"
  tags {
      Name = "${var.public_subnet_zone_c_name}"
  }
}

output "public_subnet_zone_a_id" {
   value = "${aws_subnet.public_subnet_zone_a.id}"
}

output "public_subnet_zone_b_id" {
   value = "${aws_subnet.public_subnet_zone_b.id}"
}

output "public_subnet_zone_c_id" {
   value = "${aws_subnet.public_subnet_zone_c.id}"
}

