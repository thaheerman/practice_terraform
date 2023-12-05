output "public_ip" {
  value = aws_instance.new.public_ip
  sensitive = true

}
output "private_ip" {
  value = aws_instance.new.private_ip

}
output "public_dns" {
  value = aws_instance.new.public_dns

}
output "private_dns" {
  value = aws_instance.new.private_dns

}
output "arn" {
  value = aws_instance.new.arn

}
output "instance_ami" {
  value = aws_instance.new.ami


}