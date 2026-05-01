terraform {
  backend "s3" {
    bucket = "ganeshraja-tf-state"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}