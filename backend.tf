terraform {
  backend "s3" {
    bucket = "sreyas-backend" 
    key    = "terraform"
    region = "eu-west-1"
    encrypt= true
    dynamodb_table= "terraform-lock"
  }
}
