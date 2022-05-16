# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "nic" {
  subnet_id = aws_subnet.subnet.id
  # private_ips = ["172.16.10.100"]
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
  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }
}


