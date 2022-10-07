variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy to"
  type = list(string)
}

variable "terraform_required_version" {
  description = "The required version of terraform"
  type = "= 1.1.1"
}
