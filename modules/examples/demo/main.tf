provider "aws" {
  region = "ap-southeast-1"
}

data "external" "example" {
  program = ["bash", "-c", "cat /dev/stdin"]

  query = {
    foo = "bar"
  }
}


