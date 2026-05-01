output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_app_subnet_id" {
  value = aws_subnet.private_app.id
}

output "data_subnet_id" {
  value = aws_subnet.data.id
}