# EC2 instance configuration

resource "aws_instance" "nginx-server" {
    ami ="ami-0126975fb247bf2e7"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    associate_public_ip_address = true

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF

    tags = {
        Name = "Nginx_Server"
    }
  
}