terraform {
  backend "s3" {
    bucket = "mayank-terraform-bucket"
    key    = "EKS1/terraform.tfstate"
    region = "ap-south-1"
  }
}
