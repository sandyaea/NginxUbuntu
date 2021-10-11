#--------------------------------------------
# Nginx Web Server on AWS by Terraform
#
# Made by Alexandre Arbouzov
#
# Used repository GitHub/sandyaea/NginxUbuntu
#
#--------------------------------------------

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

#---------------------------------------------------

resource "aws_security_group" "web" {
  name = "Web Security Group"

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.my_cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, { Name = "Web Security Group" })
}

resource "aws_instance" "nginx_webserver" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name               = "sandy-key-eu-ce-1"
  user_data              = file("user_data.sh")

  tags = merge(var.common_tags, { Name = "Nginx Web Server on AWS in ${var.region} region" })
}
