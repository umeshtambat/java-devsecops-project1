terraform {
  backend "s3" {
    bucket = "devopsfactory-umesh"
    key    = "env:/terraform.tfstate"
    region = "ap-south-1"
  }
}
