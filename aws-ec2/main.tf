
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
    ami ="ami-07a00cf47dbbc844c"
    instance_type = "t3.nano"

    tags = {
        Name = "SampleServer"
    }
  
}

