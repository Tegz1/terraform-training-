
#configure application load balancer security group to forward request to server.

resource "aws_security_group" "precious-terraform-training-ALB-SG" {
  name        = "precious-terraform-training-ALB-SG"
  description = "precious-terraform-training-SG to allow internet access"
  vpc_id      = aws_vpc.precious-terraform-training-vpc.id

  #inbound rules

  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Http access to ec2"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  #outbound rules

  egress = [
    {
      description      = "outbound rule"
      from_port        = 0
      to_port          = 0
      protocol         = -1
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name  = "precious-terraform-training-ALB-SG"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}
