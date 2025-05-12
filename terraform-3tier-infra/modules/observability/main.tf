resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/${var.environment}/app"
  retention_in_days = var.log_retention_in_days

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "${var.environment}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This alarm monitors high CPU usage"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.alarm_actions
}

resource "aws_cloudwatch_dashboard" "main_dashboard" {
  dashboard_name = "${var.environment}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type  = "metric"
        x     = 0
        y     = 0
        width = 24
        height = 6
        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "AutoScalingGroupName", var.asg_name ]
          ]
          view = "timeSeries"
          region = var.region
          stat   = "Average"
          title  = "EC2 CPU Utilization"
        }
      }
    ]
  })
}
