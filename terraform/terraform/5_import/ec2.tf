resource "aws_instance" "ec2_created_by_mbandi" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.nano"
    tags = {
      "Name" = "Terraform_EC2"
    }
    key_name = "nova-key"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service 
                systemctl enable httpd.service 
                echo "Hi my friend, I am $(hostname -f) Terraform > /var/www/html/index.html
                EOF
  
}

#Use the Import function to Import resoruces provisioned manually
resource "aws_instance" "ec2_created_by_mbandi_manually_import" {
  ami = "ami-0d5eff06f840b45e9"
  instance_type = "t2.nano"
  tags = {
      "Name" = "ec2_created_by_mbandi_manually_import"
    }
}
