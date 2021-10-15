
#configure application load balancer

resource "aws_lb" "precious-terraform-loadbalancer" {
  name            = "precious-terraform-loadbalancer"
  subnets         = [aws_subnet.precious-terraform-training-subnet1.id, aws_subnet.precious-terraform-training-subnet2.id]
  security_groups = [aws_security_group.precious-terraform-training-ALB-SG.id]
  internal        = false

  tags = {
    Name  = "precious-terraform-training-loadbalancer"
    env   = "precious-terraform-training"
    owner = "precious"
  }

}

#configure application load balancer target group
resource "aws_lb_target_group" "precious-tf-alb-target-group" {
  name     = "precious-tf-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.precious-terraform-training-vpc.id
  tags = {
    Name  = "precious-tf-alb-target-group"
    env   = "precious-terraform-training"
    owner = "precious"
  }

}

#configure application load balancer to listen to request

resource "aws_lb_listener" "precious-terraform-training-loadbalancer" {
  load_balancer_arn = aws_lb.precious-terraform-loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.precious-tf-alb-target-group.arn

  }
}

#Attaching the application load balancer to an ec2
resource "aws_lb_target_group_attachment" "precious-tf-alb-target-group-attachment" {
  target_group_arn = aws_lb_target_group.precious-tf-alb-target-group.arn
  target_id        = aws_instance.precious-terraform-training-windows-server.id
  port             = 80

}


/*
#Attaching the application load balancer to autoscaling group
resource "aws_lb_target_group_attachment" "precious-tf-alb-target-group-attachment" {
  target_group_arn = aws_lb_target_group.precious-tf-alb-target-group.arn
  autoscaling_group_name = aws_autoscaling_group.precious-terraform-training-as_group.id

}

*/
