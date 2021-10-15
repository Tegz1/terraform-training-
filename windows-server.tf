
#launching an ec2 instance with windows server 2019
resource "aws_instance" "precious-terraform-training-windows-server" {
  ami                         = "ami-0e9c222e1a75c8738"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.precious-terraform-training-subnet1.id
  associate_public_ip_address = "true"
  key_name                    = "keypair-precious"
  vpc_security_group_ids      = [aws_security_group.precious-terraform-training-SG.id]
  user_data                   = file("userdata.ps1")

  tags = {
    Name  = "precious-terraform-training-windows-server"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}
