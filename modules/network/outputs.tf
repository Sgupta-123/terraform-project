output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_public1_id" {
  value = aws_subnet.public_1.id
}

output "subnet_public2_id" {
  value = aws_subnet.public_2.id
}
output "subnet_private1_id" {
   value=aws_subnet.private_1.id
 }
