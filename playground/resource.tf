provider "aws" {
    
}

variable "AWS_REGION" { // default_valueはterraform.tfvarsに環境変数として埋め込むことができる
      type = string
}

variable "AMIS" {
      type = map(string)
      default = {
        ap-northeast-1 = "my ami"
      }
}


resource "aws_instance" "example1" {
  ami   = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
resource "aws_instance" "example2" {
  ami   = var.AMIS[var.AWS_REGION]
  instance_type = "t2.small"
}
resource "aws_instance" "example3" {
  ami   = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
