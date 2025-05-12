variable "vpc_cidr" {}
variable "private_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
