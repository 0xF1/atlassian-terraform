resource "aws_security_group" "dataSecGroupRancher" {
  name = "dataSecGroupRancher"
  description = "dataSecGroupRancher"
  vpc_id      = "${var.vpc_id}"

  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = ["${aws_security_group.pubSecGroupRancher.id}", "${aws_security_group.priSecGroupRancher.id}"]
      cidr_blocks = ["${var.rancher_subnet}","${var.rfc1918_subnet}"]
  }

  ingress {
      from_port = 5432
      to_port = 5432
      protocol = "tcp"
      security_groups = ["${aws_security_group.pubSecGroupRancher.id}", "${aws_security_group.priSecGroupRancher.id}"]
      cidr_blocks = ["${var.rancher_subnet}","${var.rfc1918_subnet}"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      security_groups = ["${aws_security_group.pubSecGroupRancher.id}"]
  }

  tags {
      Name = "dataSecGroupRancher"
  }
}

output "dataSecGroupRancherId" {
   value = "${aws_security_group.dataSecGroupRancher.id}"
}

