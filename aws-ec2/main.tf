
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_instance" "myserver" {
    ami ="ami-0126975fb247bf2e7"
    instance_type = "t3.micro"

    tags = {
        Name = "SampleServer"
    }
  
}

