locals {
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}

terraform {
  required_version = var.terraform_required_version
}

resource "aws_security_group" "alb_lb_sg" {
  name = var.alb_name
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type        = "ingress"
  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips

  security_group_id = aws_security_group.alb_lb_sg.id
}

resource "aws_security_group_rule" "allow_http_outbound" {
  type        = "egress"
  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips

  security_group_id = aws_security_group.alb_lb_sg.id
}

resource "aws_lb" "lb_jovanliuc" {
  name               = var.alb_name
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.alb_lb_sg.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb_jovanliuc.arn
  port              = local.http_port
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}
