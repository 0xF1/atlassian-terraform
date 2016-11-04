resource "aws_security_group" "dataSecGroupRancher" {
  name = "dataSecGroupRancher"
  description = "dataSecGroupRancher"
  vpc_id      = "${var.vpc_id}"

  #ingress {
      #from_port = 3306
      #to_port = 3306
      #protocol = "tcp"
      #security_groups = ["${aws_security_group.priSecGroupRancher.id}"]
  #}

  #ingress {
      #from_port = 3306
      #to_port = 3306
      #protocol = "tcp"
      #security_groups = ["${aws_security_group.pubSecGroupRancher.id}"]
  #}

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
      Name = "dataSecGroupRancher"
  }
}

output "dataSecGroupRancherId" {
   value = "${aws_security_group.dataSecGroupRancher.id}"
}

