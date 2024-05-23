terraform {
  backend "s3" {
    bucket = "mayank-terraform-bucket"
    key    = "jenkins/terraform.tfstate"
    region = "ap-south-1"
  }
}