resource "aws_subnet" "precious-terraform-training-subnet1" {
  vpc_id     = aws_vpc.precious-terraform-training-vpc.id
  cidr_block = "172.31.0.0/22"

  tags = {
    Name = "precious-terraform-training-subnet1"
    env = "precious-training"
  }
}

resource "aws_subnet" "precious-terraform-training-subnet2" {
  vpc_id     = aws_vpc.precious-terraform-training-vpc.id
  cidr_block = "172.31.4.0/22"

  tags = {
    Name = "precious-terraform-training-subnet2"
    env ="precious-training"
  }
}