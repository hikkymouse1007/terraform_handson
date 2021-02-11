provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = "ap-northeast-1"
}

variable "ACCESS_KEY" { // default_valueはterraform.tfvarsに環境変数として埋め込むことができる
      type = string
}

variable "SECRET_KEY" { // default_valueはterraform.tfvarsに環境変数として埋め込むことができる
      type = string
}

data aws_ssm_parameter amzn2_ami {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "myinstance" {
  ami = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    echo "Hello World from terraform" > /var/www/html/index.html
  EOF

  tags = {
        Name = "instance_from_terraforms"
    }

}

resource "aws_security_group" "mysg" {
    name = "terraform-example-instance"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

