
#subnet creation 1
resource "aws_subnet" "precious-terraform-training-subnet1" {
  vpc_id     = aws_vpc.precious-terraform-training-vpc.id
  cidr_block = "172.31.0.0/22"
  #availability_zone = "eu-west-1a"

  tags = {
    Name = "precious-terraform-training-subnet1"
    env  = "precious-training"
  }
}

#subnet creation 2
resource "aws_subnet" "precious-terraform-training-subnet2" {
  vpc_id     = aws_vpc.precious-terraform-training-vpc.id
  cidr_block = "172.31.4.0/22"
  #availability_zone = "eu-west-1b"

  tags = {
    Name  = "precious-terraform-training-subnet2"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}