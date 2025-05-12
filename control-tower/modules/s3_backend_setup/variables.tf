variable "aws_region" {
  description = "AWS region to create the S3 backend bucket in"
  type        = string
}

variable "s3_bucket_name" {
  description = "Globally unique name for the S3 backend bucket"
  type        = string
}

variable "bucket_environment" {
  description = "Environment tag for the bucket (e.g. dev, prod)"
  type        = string
}
