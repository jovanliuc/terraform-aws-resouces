variable "iam_user_names" {
  description = "The list of IAM user name"
  type        = list(string)
  default     = ["Jovanliuc", "Winnie", "George"]
}

variable "name_role_map" {
  description = "The map of role to the specific name"
  type        = map(string)
  default = {
    Jovan  = "Admin"
    Winnie = "Manager"
  }
}

variable "give_winnie_cloudwatch_full_access" {
  description = "If true, winnie gets full access to cloudwatch"
  type        = bool
}

variable "name" {
  description = "A name to render"
  type = string
}
