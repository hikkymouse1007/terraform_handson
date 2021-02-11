provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = "ap-northeast-1"
}


// 変数のvalueはterraform.tfvarsに環境変数として埋め込むことができる
variable "ACCESS_KEY" {
      type = string
}

variable "SECRET_KEY" {
      type = string
}

data aws_ssm_parameter amzn2_ami {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "example" {
  ami = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.micro"
}

