output "my_ubuntu_linux" {
  value = data.aws_ami.latest_ubuntu.name
}

output "my_availability_zones" {
  value = data.aws_availability_zones.available.names
}
