resource "aws_vpc" "precious-terraform-training-vpc" {
  cidr_block       = "172.31.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name  = "precious-terraform-training-vpc"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}