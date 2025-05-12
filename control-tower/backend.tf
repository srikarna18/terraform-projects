terraform {
  backend "s3" {
    bucket         = "my-prod-terraform-state"
    key            = "control-tower/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
