terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_server" {
  ami           = "ami-051f8a213df8bc089"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-0fc0700a8886c39c8"]
  subnet_id              = "subnet-0040669ce00dd9c33"

  tags = {
    Name = "TestTFGenInstance"
  }
}
