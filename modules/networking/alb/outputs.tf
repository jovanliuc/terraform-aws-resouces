output "alb_dns_name" {
  value = aws_lb.lb_jovanliuc.dns_name
}

output "alb_http_listener_arn" {
  value = aws_lb_listener
}

output "alb_security_group_id" {
  value = aws_security_group.alb_lb_sg.id
}
