resource "aws_security_group" "pubSecGroupRancher" {
  name = "pubSecGroupRancher"
  description = "pubSecGroupRancher"
  vpc_id      = "${var.vpc_id}"

  ingress {
      from_port = 81
      to_port = 81
      protocol = "tcp"
      self = "true"
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 2888
      to_port = 2888
      protocol = "tcp"
      self = "true"
  }

  # Only to be used if SSL is to be 
  # terminated within the Rancher server
  # rather than the ELB 
  #ingress {
      #from_port = 444
      #to_port = 444
      #protocol = "tcp"
      #self = "true"
  #}

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 6379
      to_port = 6379
      protocol = "tcp"
      self = "true"
  }

  ingress {
      from_port = 2376
      to_port = 2376
      protocol = "tcp"
      self = "true"
  }

  ingress {
      from_port = 3888
      to_port = 3888
      protocol = "tcp"
      self = "true"
  }

  ingress {
      from_port = 2181
      to_port = 2181
      protocol = "tcp"
      self = "true"
  }

  ingress {
      from_port = 18080
      to_port = 18080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 500
      to_port = 500
      protocol = "udp"
      self = "true"
  }

  ingress {
      from_port = 4500
      to_port = 4500
      protocol = "udp"
      self = "true"
  }


  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
      Name = "pubSecGroupRancher"
  }
}

output "pubSecGroupRancherId" {
   value = "${aws_security_group.pubSecGroupRancher.id}"
}
