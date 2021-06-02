resource "aws_instance" "EC2-provisioners" {
        ami = "ami-0d5eff06f840b45e9"
        instance_type = "t2.micro"
        key_name = "test-nove"
        tags = {
        "Name" = "EC2-provisioners"
        }
        #Local exec Pprovisioner
        provisioner "local-exec" {
        command = "echo ${aws_instance.EC2-provisioners.private_ip} >> private_ip.text"

    }
}

#My EIP Resource
resource "aws_eip" "my_eip" {
  instance = "${aws_instance.EC2-provisioners.id}"
  vpc      = true
  tags = { "Name" = "my_eip" }
}

#Code from Instructor
resource "null_resource" "ec2-ssh-connection" {
    connection {
          host        = "${aws_eip.my_eip.public_ip}"
          type        = "ssh"
          port        = 22
          user        = "ec2-user"
          private_key = "${file("/Users/mbandi/Downloads/test-nove.pem")}"
          timeout     = "1m"
          agent       = false
        }
    provisioner "file" {
        # cp index.html ec2-user@eip:/var/index.html
        source      = "index.html"
        destination = "/home/ec2-user/index.html"
    }
    provisioner "remote-exec" {
          inline = [
          "sudo yum update -y",
          "sudo yum install -y httpd",
          "sudo systemctl start httpd.service",
          "sudo systemctl enable httpd.service",
          "sudo systemctl enable httpd.service",
          "sudo cp /home/ec2-user/index.html /var/www/html/index.html",
       ]
    }
}

#Output the instance public IP after the run
output "MyInstanceEIP" {
    value = "${aws_eip.my_eip.public_ip}"
}

#Output Instance Private DNS
output "MyInstanceEIPDNSoutput" {
    value = "${aws_instance.EC2-provisioners.private_dns}"
}


