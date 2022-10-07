output "all_users" {
  value = aws_iam_user.iam_user_jovanliuc
}

output "all_arns" {
  value = values(aws_iam_user.iam_user_jovanliuc)[*].arn
}

output "upper_names" {
  value = [for name in var.iam_user_names : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.iam_user_names : upper(name) if length(name) <= 6]
}

output "role_2_name" {
  value = { for name, value in var.name_role_map : name => value }
}

output "for_each_name" {
  value = <<EOF
  %{~for name in var.iam_user_names}
    ${name}
  %{~endfor}
  EOF
}

output "if_else_directive" {
  value = "Hello, %{ if var.name != "" } ${var.name} %{ else } (unnamed) %{ endif }"
}
