terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
  }
}

# provider "aws" {
#   profile = "sachin"
#   region  = "us-east-1"
# }