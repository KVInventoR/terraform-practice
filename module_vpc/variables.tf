variable "aws-region" {
  type        = "string"
  default     = "us-west-2"
  description = "AWS Region in which running our environment"
}

variable "aws-profile" {
  type        = "string"
  description = "AWS Profile for configuration"
}

variable "aws-vpc-name" {
  description = "describe your variable"
  default     = "default value"
}

variable "aws-vpc-environment" {
  type        = "string"
  description = "describe your variable"
}

variable "aws-vpc-cidr" {
  description = "describe your variable"
  default     = "default value"
}

variable "aws-vpc-subnet-azs" {
  type    = "list"
  default = []
}

variable "aws-vpc-subnet-public" {
  type    = "list"
  default = []
}

variable "aws-vpc-subnet-private" {
  type    = "list"
  default = []
}

variable "aws-vpc-nat-enable" {
  description = "describe your variable"
}

variable "aws-vpc-nat-single" {
  description = "Single instance for nat"
}

# variable "main-dmz-subnets" {
#   description = "Main VPC DMZ Subnet names"
#   type        = "list"


#   default = [
#     "sn-dmz-main-us-west-2a",
#     "sn-dmz-main-us-west-2b",
#     "sn-dmz-main-us-west-2c",
#   ]
# }

