terraform {
  backend "s3" {
    bucket = "mayank-terraform-bucket"
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}