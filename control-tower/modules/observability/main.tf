resource "aws_cloudwatch_log_group" "app" {
  name = "/app/logs"
  retention_in_days = 7
}
