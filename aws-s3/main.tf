terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo_bucket" {
    bucket = "my-demo-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket_date" {
    bucket = aws_s3_bucket.demo_bucket.bucket
    source = "./myfile.txt"
    key = "mydata.txt"
}

output "name" {
    value = random_id.rand_id.hex
}