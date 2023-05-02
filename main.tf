terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region = var.region
}

resource "aws_instance" "Terraform" {
  ami = var.ami
  count = 1
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.TerraformRules.id]

  tags = {
    Name = "NewTerraform"
  }
  key_name = aws_key_pair.demo_key.key_name
}

#resource "aws_key_pair" "tf-key-pair" {
#  key_name = var.key_pair_name
#  public_key = var.public_key
#}

###
# МЕТОД С ИСПОЛЬЗОВАНИЕМ TLS PRIVATE KEY
resource "tls_private_key" "key_algorithm" {
  algorithm = "RSA"
  rsa_bits = 4096
}

#Resource to Create Key Pair
resource "aws_key_pair" "demo_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.key_algorithm.public_key_openssh

  provisioner "local-exec"{
    command = "echo '${tls_private_key.key_algorithm.private_key_pem}' > ./${var.key_pair_name}.pem"
  }
}
###

resource "aws_security_group" "TerraformRules" {
  name = "my-security-group"
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    protocol  = "tcp"
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
}
