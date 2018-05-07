# main.tf for simple configuration 
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "${var.aws-vpc-name}"
  cidr   = "${var.aws-vpc-cidr}"

  # azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  # azs = "${join(",", keys(var.aws-vpc-subnet-public))}"
  azs = "${var.aws-vpc-subnet-azs}"

  public_subnets     = "${var.aws-vpc-subnet-public}"
  private_subnets    = "${var.aws-vpc-subnet-private}"
  enable_nat_gateway = "${var.aws-vpc-nat-enable}"
  single_nat_gateway = "${var.aws-vpc-nat-single}"

  tags = {
    Terraform   = "true"
    Environment = "${var.aws-vpc-environment}"
  }
}
