output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnet : subnet.id]
}
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
