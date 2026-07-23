
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "my-demo-bucket-ffb40e0a0d53bf45"
    key    = "backend.tfstate"
    region = "ap-south-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myserver" {
    ami ="ami-07a00cf47dbbc844c"
    instance_type = "t3.nano"

    tags = {
        Name = "SampleServer"
    }
  
}

