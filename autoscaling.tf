# Create a launch template
resource "aws_launch_template" "webserver_template" {
  name = "launch-template-tf"

  image_id = "ami-08e2d37b6a0129927"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t3.micro"

  key_name = "vockey"

  vpc_security_group_ids = [aws_security_group.http_security.id]

  user_data = filebase64("userdata.sh")
}

# Create an autoscaling group
resource "aws_autoscaling_group" "autoscaling_webserver" {
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 2

  launch_template {
    id      = aws_launch_template.webserver_template.id
    version = "$Latest"
  }
}

# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "asg_attachment_webserver" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_webserver.id
  lb_target_group_arn    = aws_lb_target_group.webserver_target.arn
}