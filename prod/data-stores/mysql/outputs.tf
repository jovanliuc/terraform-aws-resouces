output "db_address" {
  value = aws_db_instance.terraform_db_prod.address
}

output "db_port" {
  value = aws_db_instance.terraform_db_prod.port
}
