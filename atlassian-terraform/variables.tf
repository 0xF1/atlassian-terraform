variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "aws_key_name" {
  description = "Desired name of AWS key pair"
  default     = "phooper-aws"
}


variable "aws_access_key" {
  description = "AWS access_key for connection."
  default = ""
}

variable "aws_secret_key" {
  description = "AWS secret_key for connection."
  default = ""
}

