provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "testing-bucket121210"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true

  }
}

module "vpc" {
  source = "../module/vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}