
#configure the subnet associations in the route table

resource "aws_route_table_association" "precious-terraform-training-route-subnet1-association" {
  subnet_id      = aws_subnet.precious-terraform-training-subnet1.id
  route_table_id = aws_route_table.precious-terraform-training-routetable.id
}

resource "aws_route_table_association" "precious-terraform-training-route-subnet2-association" {
  subnet_id      = aws_subnet.precious-terraform-training-subnet2.id
  route_table_id = aws_route_table.precious-terraform-training-routetable.id
}