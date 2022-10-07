variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
  default     = "webserver-prod"
}

variable "db_remote_state_bucket" {
  description = "The name of S3 bucket used for the database's remote state storage"
  type        = string
  default     = "jovanliuc-terraform-state"
}

variable "db_remote_state_key" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "prod/data-stores/mysql/terraform.tfstate"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = string
  default     = 10
}
