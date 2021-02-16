# terraform_handson
Udemy:https://www.udemy.com/course/learn-devops-infrastructure-automation-with-terraform

### AWS provider
https://registry.terraform.io/providers/hashicorp/aws/latest/docs
## section8

```
# source:main.tf
~/Desktop/terraform_handson/$ terraform console
> var.myvar
hello terraform
> var.mymap
{
  "mykey" = "my value"
}
> var.mymap.mykey
my value
>

> var.myvar
hello terraform

> "${var.myvar}"
hello terraform

> var.mymap
{
  "mykey" = "my value"
}
> var.mymap["mykey"]
my value

> var.mylist
[
  1,
  2,
  3,
]
> var.mylist[0]
1
> element(var.mylist, 0)
1
> element(var.mylist, 1)
2
> slice(var.mylist, 0, 2)
[
  1,
  2,
]

> var.AWS_REGION
ap-northeast-1

> var.AMIS
{
  "ap-northeast-1" = "my ami"
}
> var.AMIS[var.AWS_REGION]
my ami
>
```

### メモ
providerを変更したら

```
terraform init
```
を実行する

## Section9
### Setup AWS Account for terraform
- IAMからterraformユーザを作成
- administraion-accessを許可したユーザグループに追加

## Section10
Linux2のAMIのIDの取得方法
https://dev.classmethod.jp/articles/get-the-latest-amazon-linux-2-ami-id-with-cloudformation/
https://dev.classmethod.jp/articles/launch-ec2-from-latest-amazon-linux2-ami-by-terraform/

テンプレートのデバッグ
https://www.terraform.io/docs/language/expressions/references.html
https://future-architect.github.io/articles/20190819/

最新のamiのidを取得する方法

```
data aws_ssm_parameter amzn2_ami {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "example" {
  ami = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.micro"
}

```

## Variable Types
- simple types
  - String
  - Number
  - Bool

- complex type
  - List
    [0,1,5,2]
  - Set
    [5,1,1,2] => [1,2,5]
  - Map
    {"key" = "value"}
  - Object
    {
      firstname = "John"
      housenumber = 10
    }
  - Tuple
  [0,"string",false]
