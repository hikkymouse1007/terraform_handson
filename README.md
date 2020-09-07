# terraform_handson

## section8 

```
# source:main.tf
$ terraform console

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