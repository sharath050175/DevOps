provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myinstance" {
    tags = {
        Name = "Project-Server"  
}
ami = "ami-02b8269d5e85954ef"
instance_type = "t2.micro"
key_name = "Live-key"
security_groups = ["default"]

root_block_device {
    volume_type = "gp2"
    volume_size = "30"
    delete_on_termination = true
 }

}

output "instance_public_ip" {
    value = aws_instance.myinstance.public_ip
  
}