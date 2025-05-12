provider "aws" {
  region = "us-east-1"
}

module "control_tower" {
  source = "./modules/control_tower"
  account_name       = var.account_name
  account_email      = var.account_email
  ssouser_email      = var.ssouser_email
  ssouser_firstname  = var.ssouser_firstname
  ssouser_lastname   = var.ssouser_lastname
  managed_ou         = var.managed_ou
}

module "network" {
  source          = "./modules/network"
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "compute" {
  source         = "./modules/compute"
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = module.network.private_subnet_ids[0]
}

module "observability" {
  source = "./modules/observability"
}

