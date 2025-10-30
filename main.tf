terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "./modules/vpc"
  name           = "my-vpc"
  cidr_block     = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-east-1a", "us-east-1b"]
}

module "security_group" {
  source           = "./modules/security_group"
  name             = "my-sg"
  vpc_id           = module.vpc.vpc_id
  ssh_allowed_cidr = "197.211.52.75"
 
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source               = "./modules/ec2"
  name                 = "my-ec2-instance"
  instance_type        = "t3.micro"
  subnet_id            = module.vpc.public_subnet_ids[0]
  key_name             = "my-key-pair"
  security_group_ids   = [module.security_group.security_group_id]
  iam_instance_profile = module.iam.iam_instance_profile
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-terraform-project-bucket-leo2213"
  versioning  = true
  acl         = "private"
  tags = {
    Environment = "Dev"
  }
}