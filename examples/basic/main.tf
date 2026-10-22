variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = "terraform-aws-network"
      ManagedBy = "terraform"
    }
  }
}

module "network" {
  source = "../../modules/vpc"

  name                 = "demo"
  azs                  = ["${var.region}a", "${var.region}b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  allowed_https_cidrs  = []
}