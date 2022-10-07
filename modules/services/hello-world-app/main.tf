module "asg" {
  source = "../../cluster/asg-rolling-deploy"

  cluster_name = "hello-world-${var.environment}"
  ami = var.ami
  user_data = data.template_file.user_data.rendered
  instance_type = var.instance_type

  min_size = var.min_size
  max_size = var.max_size
  enable_autoscaling = var.enable_autoscaling

  subnet_ids = data.aws_subnet_ids.default_subnets.ids
  target_group_arns = [aws_lb_target_group.lb_tg_jovanliuc.arn]

  custom_tags = var.custom_tags
}

module "alb" {
  source = "../../networking/alb"
  alb_name = "hello-world-${var.environment}"
  subnet_ids = data.aws_subnet_ids.default_subnets.ids
}

data "template_file" "user_data" {
  template = file("${path.module}/${var.user_data_file_path}")

  vars = {
    server_port = var.server_port
    db_address  = data.terraform_remote_state.terraform_db.outputs.db_address
    db_port     = data.terraform_remote_state.terraform_db.outputs.db_port
    server_text = var.server_text
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnets" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_lb_target_group" "lb_tg_jovanliuc" {
  name     = "hello-world-${var.environment}"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 10
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "lb_lr_jovanliuc" {
  listener_arn = module.alb.alb_http_listener_arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg_jovanliuc.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

data "terraform_remote_state" "terraform_db" {
  backend = "s3"

  config = {
    bucket = var.db_remote_state_bucket
    key    = var.db_remote_state_key
    region = "ap-southeast-1"
  }
}
