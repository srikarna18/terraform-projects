output "account_id" {
  value = module.control_tower.account_id
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "log_group" {
  value = module.observability.log_group_name
}
