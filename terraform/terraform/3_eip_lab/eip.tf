resource "aws_eip" "my_eip" {
  instance = "${aws_instance.MyFirstEC2WithTerraform.id}"
  vpc      = true
}

#Output the instance public IP after the run
output "my-elastic-ip-address" {
    value = "${aws_eip.my_eip.public_ip}"
}