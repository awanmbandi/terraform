resource "aws_instance" "MyFirstEC2WithTerraform" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
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