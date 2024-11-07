# Amazon Web Services

## How to find AMI ID

### Find latest Ubuntu version

```shell
aws ec2 describe-images --owners 679593333241\
  --filters "Name=name,Values=ubuntu-*-20.04-*" "Name=architecture,Values=x86_64" \
  --query 'reverse(sort_by(Images, &CreationDate)[*].[CreationDate,Name,ImageId])[:1]' \
  --output text
```

### Find latest RHEL version

```shell
aws ec2 describe-images --owners 309956199498 \
  --filters "Name=name,Values=RHEL-8*" "Name=architecture,Values=x86_64"\
  --query 'reverse(sort_by(Images, &CreationDate)[*].[CreationDate,Name,ImageId])[:1]' \
  --output text
```

### Find latest CentOS version

```shell
aws ec2 describe-images --owners 125523088429 \
  --filters "Name=name,Values=CentOS 8*" "Name=architecture,Values=x86_64" \
  --query 'reverse(sort_by(Images, &CreationDate)[*].[CreationDate,Name,ImageId])[:1]' \
  --output text
```
