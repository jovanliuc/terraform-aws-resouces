output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "asg_name" {
  value = module.asg.asg_group
}

output "instance_security_group_id" {
  value = module.asg.instance_security_group_id
}
