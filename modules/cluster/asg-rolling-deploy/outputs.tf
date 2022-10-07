output "asg_group" {
  value = aws_autoscaling_group.asg_jovanliuc.name
}

output "instance_security_group_id" {
  value = aws_security_group.instance_sg.id
}
