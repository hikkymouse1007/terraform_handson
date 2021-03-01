variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_REGION" {
  default = "ap-northeast-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-1 = "ami-09d28faae2e9e7138"
    ap-northeast-2 = "ami-006e2f9fa7597680a"
    ap-northeast-3 = "ami-006e2f9fa7597680a"
  }
}

