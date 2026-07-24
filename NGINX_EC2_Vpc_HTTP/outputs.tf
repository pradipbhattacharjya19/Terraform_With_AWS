output "instance_public_ip" {
   description = "Public IP address of the EC2 instance"
   value = aws_instance.nginx-server.public_ip
 }

output "instance_url" {
   description = "URL to access the Nginx server"
   value = "http://${aws_instance.nginx-server.public_ip}"
 }