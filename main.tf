provider "aws" {
  region = var.region
}

resource "aws_security_group" "ec2_public_security_group2" {
  name        = "EC2-Public-SG"
  description = "internet reaching access for EC2 Instances"
  vpc_id      = "vpc-060c8e0e0896c4544"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "jenkins2" {
  instance_type   = var.instance_type
  ami             = var.ami_id
  key_name        = "tt"
  security_groups = ["${aws_security_group.ec2_public_security_group2.name}"]
  user_data       = file("userdata.tpl")
  tags = {
    "Name" = "Auto-Jenkins",
    LOB    = var.lob_dev
  }
}

