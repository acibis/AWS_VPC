# Configure backend 
terraform {
  backend "s3" {
      key    = "main.tfstate"
  }
}