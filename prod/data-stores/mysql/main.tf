provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "jovanliuc-terraform-state"
    key            = "prod/data-stores/mysql/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

resource "aws_db_instance" "terraform_db_prod" {
  identifier_prefix = var.mysql_database_identifier_prefix
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  allocated_storage = 10
  name              = var.mysql_database_name
  username          = "admin"
  password          = var.mysql_database_master_password
}

