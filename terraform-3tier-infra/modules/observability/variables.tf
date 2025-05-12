variable "environment" {
  description = "Environment name"
  type        = string
}

variable "asg_name" {
  description = "Auto Scaling Group Name to monitor"
  type        = string
}

variable "log_retention_in_days" {
  description = "Retention period for log group"
  type        = number
  default     = 7
}

variable "alarm_actions" {
  description = "SNS topics or actions triggered by CloudWatch alarms"
  type        = list(string)
  default     = []
}

variable "region" {
  description = "AWS region"
  type        = string
}
