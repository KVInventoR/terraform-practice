module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "allow-ports"
  description = "Security group for access to custom infrastructure"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
