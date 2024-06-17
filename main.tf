terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}


module "network" {
  source = "./modules/network"
  region1 = var.region1
  region2 = var.region2

}

module "load_balancer" {
  source = "./modules/load_balancer"

  lb_name            = var.lb_name
  vpc_id             = module.network.vpc_id
  subnet_public1_id        = module.network.subnet_public1_id
  subnet_public2_id        = module.network.subnet_public2_id
  ip_address = var.ip_address
  }

module "instance" {
  source = "./modules/instance"
  lb_name     = var.lb_name
  subnet_private1_id = module.network.subnet_private1_id
  load_balancer_ec2_instance = module.load_balancer.load_balancer_ec2_instance
  aws_lb_target_group = module.load_balancer.aws_lb_target_group.arn
  instance_type = var.instance_type

}