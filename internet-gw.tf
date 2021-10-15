
#configure internet gateway

resource "aws_internet_gateway" "precious-terraform-training-igw" {
  vpc_id = aws_vpc.precious-terraform-training-vpc.id

  tags = {
    Name  = "precious-terraform-training-igw"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}

