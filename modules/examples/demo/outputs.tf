output "echo" {
  value = data.external.example.result
}

output "echo_foo" {
  value = data.external.example.result.foo
}
