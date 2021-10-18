
#setting up autoscaling launch configuration

resource "aws_launch_configuration" "precious-terraform-training-as_conf" {
  name_prefix   = "precious-terraform-training-as_conf"
  image_id      = var.image_id_webserver1
  instance_type = "t2.medium"
  key_name      = "keypair-precious"
  user_data_base64 = var.userdata
  lifecycle {
    create_before_destroy = true
  }
}

#configuring autoscaling group

resource "aws_autoscaling_group" "precious-terraform-training-as_group" {
  name                 = "precious-terraform-training-as_group"
  launch_configuration = aws_launch_configuration.precious-terraform-training-as_conf.name
  vpc_zone_identifier  = [aws_subnet.precious-terraform-training-subnet1.id, aws_subnet.precious-terraform-training-subnet2.id]
  min_size             = 1
  max_size             = 4
  desired_capacity     = 1

 target_group_arns = [aws_lb_target_group.precious-tf-alb-target-group.arn]

  tag {
    key                 = "Name"
    value               = "precious-terraform-training-AS-server"
    propagate_at_launch = true
  }
  tag {
    key                 = "env"
    value               = "precious-terraform-training"
    propagate_at_launch = true
  }
   tag {
    key                 = "owner"
    value               = "precious"
    propagate_at_launch = true
  }
}


