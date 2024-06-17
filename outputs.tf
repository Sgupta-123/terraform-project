output "application_load_balancer" {
  description = "dns name of load balancer is"
  value=module.load_balancer.application_load_balancer
}
output "ec2_instance_public_ip" {
 description = "public ip is"
  value = module.instance.ec2_instance_public_ip
}