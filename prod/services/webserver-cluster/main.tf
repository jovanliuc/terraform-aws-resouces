provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "local" {
    path = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/hello-world-app"

  cluster_name           = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
  instance_type          = var.instance_type
  min_size               = var.min_size
  max_size               = var.max_size

  custom_tags = {
    Name       = "terraform-prod"
    Owner      = "jovanliuc"
    DeployedBy = "terraform"
  }

  enable_autoscaling   = true
  enable_new_user_data = false
}
