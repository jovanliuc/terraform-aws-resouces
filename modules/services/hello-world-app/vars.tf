variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of S3 bucket used for the database's remote state storage"
  type        = string
}

variable "db_remote_state_key" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "terraform-alb-jovanliuc"
}

variable "alb_target_group_name" {
  description = "The name of the ALB target group"
  type        = string
  default     = "terraform-alb-tg-jovanliuc"
}

variable "instance_security_group_name" {
  description = "The name of the security group for the EC2 instances"
  type        = string
  default     = "terraform-instance-sg-jovanliuc"
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "terraform-alb-sg-jovanliuc"
}

variable "user_data_file_path" {
  description = "The whole path of the user data file"
  type        = string
  default     = "user-data.sh"
}

variable "user_data_new_file_path" {
  description = "The whole path of the user data file"
  type        = string
  default     = "user-data-new.sh"
}

variable "custom_tags" {
  description = "Custom tags to set on the instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}

variable "scale_out_recurrence" {
  description = "The cron expression of recurrence for scaling out"
  type        = string
  default     = "0 9 * * *"
}

variable "scale_in_recurrence" {
  description = "The cron expression of recurrence for scaling in"
  type        = string
  default     = "0 17 * * *"
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type = string
  default = "ami-055d15d9cfddf7bd3"
}

variable "server_text" {
  description = "The text the web server should return"
  type = string
  default = "Hello, World"
}

variable "environment" {
  description = "The name of environment we're deploying to"
  type = string
}
