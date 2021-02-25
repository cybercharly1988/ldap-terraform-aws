output "instance_ip" {
  value = aws_instance.hello_foxpass.*.public_ip
}
