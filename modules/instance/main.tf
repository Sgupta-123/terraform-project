data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  subnet_id     = "${var.subnet_private1_id}"
  vpc_security_group_ids = ["${var.load_balancer_ec2_instance}"]
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              # Update all packages
              yum update -y

              # Install Nginx
              amazon-linux-extras enable nginx1
              yum clean metadata
              yum install -y nginx

              # Start Nginx
              systemctl start nginx
              systemctl enable nginx

              # Create a custom index.html
              echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  }
}

resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = "${var.aws_lb_target_group}"
  target_id        = aws_instance.web.id
  port             = 80
}