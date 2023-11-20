terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

    # Configure Terraform to store the state in your S3 bucket (with encryption and locking)
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "terraform-state-key20231117084134961500000001"
    key = "workspaces-example/terraform.tfstate"
    region = "us-east-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
 }

}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
    ami = "ami-0fb653ca2d3203ac1"
    instance_type = terraform.workspace == "default" ? "t2.medium": "t2.micro"

    tags = {
      Name = "PROD"
    }

}