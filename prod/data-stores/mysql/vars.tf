variable "mysql_database_identifier_prefix" {
  description = "The identifier prefix of the database"
  type        = string
  default     = "terraform-database-prod-ip"
}

variable "mysql_database_name" {
  description = "The name to use for the database"
  type        = string
  default     = "terraform_database_prod"
}

variable "mysql_database_master_password" {
  description = "The password of mysql database"
  type        = string
}
