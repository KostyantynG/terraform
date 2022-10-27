resource "aws_instance" "first_instance" {
  ami                         = "ami-08e2d37b6a0129927"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.private_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.http_security.id]
  key_name                    = "vockey"
  user_data                   = file("userdata.sh")
  tags = {
    Name = "Amazon_Linux_2_t2_micro"
  }
}