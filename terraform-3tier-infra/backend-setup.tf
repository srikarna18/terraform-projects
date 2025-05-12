

provider "aws" {
  region = "us-west-2"  # Change to your AWS region
}

module "s3_backend" {
  source = "./control-tower/modules/s3_backend_setup"  # Replace this with your actual module source path
  
  bucket_name        = "my-tfstate-bucket"  # Replace with your desired S3 bucket name
  region             = "us-west-2"  # AWS Region
}

output "s3_bucket_name" {
  value = module.s3_backend.bucket_name
}
