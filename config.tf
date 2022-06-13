terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.64.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-09d56f8956ab235b3" # us-west-2
  instance_type = "t2.micro"
}