variable "bucket_name" {
  description = "The name of s3 bucket. Must be globally unique"
  type        = string
  default     = "jovanliuc-terraform-state"
}

variable "table_name" {
  description = "The name of DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform-up-and-running-locks"
}