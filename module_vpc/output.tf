output "configuration" {
  value = <<CONFIGURATION


"${join(",", var.aws-vpc-subnet-public)}"


CONFIGURATION
}
