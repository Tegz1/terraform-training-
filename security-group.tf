
#configure sever security group

resource "aws_security_group" "precious-terraform-training-SG" {
  name        = "precious-terraform-training-SG"
  description = "precious-terraform-training-SG to allow internet access"
  vpc_id      = aws_vpc.precious-terraform-training-vpc.id

  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.precious-terraform-training-ALB-SG.id]
      self             = false
    },
    #inbound rule to allow access from the application load balancer
    {
      description      = "Http access to ec2"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.precious-terraform-training-ALB-SG.id]
      self             = false
    }
    ,


    {
      description      = "rdp access to ec2"
      from_port        = 3389
      to_port          = 3389
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }


  ]

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
    Name  = "precious-terraform-training-SG"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}
