output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "db_subnet_ids" {
  value = aws_subnet.db[*].id
}

output "alb_sg" {
  value = aws_security_group.alb_sg.id
}

output "app_sg" {
  value = aws_security_group.app_sg.id
}

output "db_sg" {
  value = aws_security_group.db_sg.id
}
