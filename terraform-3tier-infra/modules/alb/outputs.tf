output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.app_alb.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.app_tg.arn
}
