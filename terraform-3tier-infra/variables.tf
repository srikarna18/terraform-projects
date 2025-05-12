variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "db_subnets" {
  description = "List of DB subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for app servers"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type for RDS DB"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS DB"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS DB"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "alarm_actions" {
  description = "SNS topics or actions triggered by CloudWatch alarms"
  type        = list(string)
  default     = []
}
