variable "account_name" {}
variable "account_email" {}
variable "ssouser_email" {}
variable "ssouser_firstname" {}
variable "ssouser_lastname" {}
variable "managed_ou" {}

variable "vpc_cidr" {}
variable "private_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}

variable "ami" {}
variable "instance_type" {}
