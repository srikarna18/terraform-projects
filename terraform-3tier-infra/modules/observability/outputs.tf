output "log_group_name" {
  value = aws_cloudwatch_log_group.app_logs.name
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.main_dashboard.dashboard_name
}
