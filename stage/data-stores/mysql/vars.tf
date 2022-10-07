variable "mysql_database_identifier_prefix" {
  description = "The identifier prefix of the database"
  type        = string
  default     = "terraform-database-stage-ip"
}

variable "mysql_database_name" {
  description = "The name to use for the database"
  type        = string
  default     = "terraform_database_stage"
}

variable "mysql_database_master_password" {
  description = "The password of mysql db"
  type        = string
}
