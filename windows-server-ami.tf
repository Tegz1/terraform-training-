
#configure ami from the windows server
resource "aws_ami_from_instance" "precious-terraform-training-server-ami" {
  name               = "precious-terraform-training-server-ami"
  source_instance_id = aws_instance.precious-terraform-training-windows-server.id

  tags = {
    Name  = "precious-terraform-training-ALB-SG"
    env   = "precious-terraform-training"
    owner = "precious"
  }
}