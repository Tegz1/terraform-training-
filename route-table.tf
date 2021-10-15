
#configuring the vpc route table
resource "aws_route_table" "precious-terraform-training-routetable" {
  vpc_id = aws_vpc.precious-terraform-training-vpc.id



  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.precious-terraform-training-igw.id
      #everything below this line is supposed to be optional but it refuses to work for some reason without this options.
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""

      egress_only_gateway_id      = ""
      instance_id                 = ""
      ipv6_cidr_block             = ""
      local_gateway_id            = ""
      nat_gateway_id              = ""
      network_interface_id        = ""
      transit_gateway_id          = ""
      vpc_endpoint_id             = ""
      "vpc_peering_connection_id" = ""
    }
  ]

  tags = {
    Name  = "precious-terraform-training-routetable"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}
