#ec2 instance creation
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  aws_instance_ami       = var.aws_instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
}
