resource "aws_security_group" "dataSecGroupAtlassian" {
  name = "dataSecGroupAtlassian"
  description = "dataSecGroupAtlassian"
  vpc_id      = "${var.vpc_id}"

  ingress {
      from_port = 5432
      to_port = 5432
      protocol = "tcp"
      security_groups = ["${aws_security_group.priSecGroupAtlassian.id}"]
  }

  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = ["${aws_security_group.priSecGroupAtlassian.id}"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      security_groups = ["${aws_security_group.priSecGroupAtlassian.id}"]
  }

  tags {
      Name = "dataSecGroupAtlassian"
  }
}

output "dataSecGroupAtlassianId" {
   value = "${aws_security_group.dataSecGroupAtlassian.id}"
}

