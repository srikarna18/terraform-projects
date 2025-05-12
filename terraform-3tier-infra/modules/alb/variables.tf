variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "alb_security_group" {
  description = "Security group for the ALB"
  type        = string
}

variable "environment" {
  description = "Environment tag (e.g., dev, prod)"
  type        = string
}
