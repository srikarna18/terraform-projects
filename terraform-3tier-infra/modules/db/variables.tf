variable "db_subnet_ids" {
  description = "List of DB subnet IDs"
  type        = list(string)
}

variable "db_security_group" {
  description = "Security group ID for RDS DB instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type for RDS"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS DB"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password for the RDS DB"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "environment" {
  description = "Environment tag (e.g., dev, prod)"
  type        = string
}
