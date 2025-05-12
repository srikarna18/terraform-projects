provider "aws" {
  region = var.region
}

module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  db_subnets         = var.db_subnets
  azs                = var.azs
  environment        = var.environment
}

module "alb" {
  source                 = "./modules/alb"
  vpc_id                 = module.network.vpc_id
  public_subnet_ids      = module.network.public_subnet_ids
  alb_security_group     = module.network.alb_sg
  environment            = var.environment
}

module "app" {
  source                     = "./modules/app"
  vpc_id                     = module.network.vpc_id
  private_subnet_ids         = module.network.private_subnet_ids
  instance_type              = var.instance_type
  ami_id                     = var.ami_id
  alb_target_group_arn       = module.alb.target_group_arn
  app_security_group        = module.network.app_sg
  environment               = var.environment
}

module "db" {
  source                 = "./modules/db"
  db_subnet_ids          = module.network.db_subnet_ids
  db_security_group      = module.network.db_sg
  db_instance_class      = var.db_instance_class
  db_username            = var.db_username
  db_password            = var.db_password
  db_name                = var.db_name
  environment            = var.environment
}

module "observability" {
  source                 = "./modules/observability"
  environment            = var.environment
  asg_name               = module.app.asg_name
  region                 = var.region
  alarm_actions          = var.alarm_actions
}
