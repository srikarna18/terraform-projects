output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "db_subnet_ids" {
  value = module.network.db_subnet_ids
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "asg_name" {
  value = module.app.asg_name
}

output "db_endpoint" {
  value = module.db.db_endpoint
}

output "db_instance_id" {
  value = module.db.db_instance_id
}

output "log_group_name" {
  value = module.observability.log_group_name
}

output "dashboard_name" {
  value = module.observability.dashboard_name
}
