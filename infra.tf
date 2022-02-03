# Create EC2 instances with linux
# Install docker engine
# Output public_ip



provider "aws" {
    access_key = file("Access Key ID.txt")
    secret_key = file("Secret Access Key.txt")
    region = "us-east-2"
  }

resource "aws_key_pair" "idrsa" {
    key_name = "id_rsa"
    public_key = file("idrsa.txt")
}

resource "aws_instance" "webdev" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data = file ("dockerun.sh")
  key_name = "id_rsa"
  
  tags = {
    Name = "WebServer-1"
  }
}


resource "aws_instance" "webprod" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data = file ("dockerun.sh")
  key_name = "id_rsa"
  
  tags = {
    Name = "WebServer-2"
  }
}

resource "aws_security_group" "webserver" {
  name        = "allow_all"
  description = "Allow inbound traffic"

 ingress {
    description      = "ICMP"
    from_port        = 8
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
}

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }  

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "http/s/, ssh"
  }
}

output "WebServer-1_publicIP" {
    value = aws_instance.webdev.public_ip
}

output "WebServer-2_publicIP" {
    value = aws_instance.webprod.public_ip
}


  
