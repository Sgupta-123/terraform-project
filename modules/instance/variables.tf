variable "lb_name" {
  description = "Load Balancer name"
  type        = string
}

variable "subnet_private1_id"{
    description="ec2 instance name"
    type=string
}

variable "load_balancer_ec2_instance"{
    description="load balancer for ec2 instance"
    type=string
}
variable "aws_lb_target_group" {
  description = "load balancer attachment for ec2"
  type = string
}
 
variable "instance_type" {
  description = "given instance type"
  type = string
}