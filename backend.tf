terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-leo2213"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
