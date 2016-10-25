variable "vpc_id"          {}

resource "aws_security_group" "priSecGroupAtlassian" {
  name = "priSecGroupAtlassian"
  description = "priSecGroupAtlassian"
  vpc_id      = "${var.vpc_id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      security_groups = ["${aws_security_group.pubSecGroupAtlassian.id}"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.pubSecGroupAtlassian.id}"]
  }

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      security_groups = ["${aws_security_group.pubSecGroupAtlassian.id}"]
  }

  ingress {
      from_port = 9000
      to_port = 9003
      protocol = "tcp"
      security_groups = ["${aws_security_group.pubSecGroupAtlassian.id}"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      security_groups = ["${aws_security_group.pubSecGroupAtlassian.id}"]
  }

  tags {
      Name = "priSecGroupAtlassian"
  }
}

output "priSecGroupAtlassianId" {
   value = "${aws_security_group.priSecGroupAtlassian.id}"
}

