provider "aws" {
  region = "ap-southeast-1"
}

module "asg" {
  source = "../../cluster/asg-rolling-deploy"

  cluster_name       = var.cluster_name
  ami = "ami-055d15d9cfddf7bd3"
  instance_type = "t2.micro"

  min_size= 1
  max_size = 1
  enable_autoscaling = false

  subnet_ids = data.aws_subnet_ids.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
