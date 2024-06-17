output "aws_lb_target_group" {
   value=aws_lb_target_group.main
 }
 output "load_balancer_ec2_instance" {
   value = aws_security_group.load_balancer_ec2_instance.id
 }
output "application_load_balancer"{
value = aws_alb.application_load_balancer.dns_name
 }