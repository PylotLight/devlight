# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.aws_region
}

resource "aws_network_interface" "nic" {
  subnet_id         = aws_subnet.subnet.id
  ipv6_prefix_count = 1
}

resource "aws_security_group" "sg" {
  name        = "AWS SG"
  description = "Terraform created SG"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Create (and display) an SSH key
resource "tls_private_key" "aws_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh_key" {
  public_key = tls_private_key.aws_ssh_key.public_key_openssh
}

#create an instance
resource "aws_instance" "instance" {
  ami                         = "ami-0c6120f461d6b39e9"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
}


