output "db_address" {
  value = aws_db_instance.terraform-db-intance.address
}

output "db_port" {
  value = aws_db_instance.terraform-db-intance.port
}
