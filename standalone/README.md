# Cloud Formation

## Create AWS Resources using cloudformation.

### Edit parameters in auto_scaling.yml.

```
Parameters:
  ImageId:
    Type: "String"
    Default: "<AMI_ID>"
  KeyName:
    Type: "String"
    Default: "<SSH_KEY_NAME>"
  AllowSsh:
    Type: "String"
    Default: "<ALLOW_SSH_HOST_IP_ADDRESS>"
  InstanceType:
    Type: "String"
    Default: "<INSTANCE_TYPE>"
  VpcCidrBlock:
    Type: "String"
    Default: "<VPC_CIDR_BLOCK>"
  PublicSubnetCidrBlock1a:
    Type: "String"
    Default: "<AZ1A_PUBLIC_CIDR_BLOCK>"
  PublicSubnetCidrBlock1c:
    Type: "String"
    Default: "<AZ1C_PUBLIC_CIDR_BLOCK"＞
  PrivateSubnetCidrBlock1a:
    Type: "String"
    Default: "<AZ1A_PRIVATE_CIDR_BLOCK>"
  PrivateSubnetCidrBlock1c:
    Type: "String"
    Default: "<AZ1C_PRIVATE_CIDR_BLOCK"＞
```

### Edit parameters in ec2.yml.

```
Parameters:
  Prefix:
    Type: "String"
    Default: "<Prefix>"
  ImageId:
    Type: "String"
    Default: "<AMI_ID>"
  KeyName:
    Type: "String"
    Default: "<KEY_PAIR_NAME>"
  AllowSsh:
    Type: "String"
    Default: "<ALLOW_SSH_CIDR_BLOCK>"
  InstanceType:
    Type: "String"
    Default: "<INSTANCE_TYPE>"
  VpcCidrBlock:
    Type: "String"
    Default: "<VPC_CIDR_BLOCK>"
  SubnetCidrBlock1a:
    Type: "String"
    Default: "<AZ1A_PUBLIC_CIDR_BLOCK>"
  SubnetCidrBlock1c:
    Type: "String"
    Default: "<AZ1C_PUBLIC_CIDR_BLOCK>"
```

### Edit parameters in elasticache.yml.

```
Parameters:
  Prefix:
    Type: "String"
    Default: ""
  InstanceType:
    Type: "String"
    Default: "<INSTANCE_TYPE>" : Instance type needs greater than cache.m3.medium for Multi AZ.
  VpcCidrBlock:
    Type: "String"
    Default: "<VPC_CIDR_BLOCK>"
  PublicSubnetCidrBlock1a:
    Type: "String"
    Default: "<AZ1A_PUBLIC_CIDR_BLOCK>"
  PublicSubnetCidrBlock1c:
    Type: "String"
    Default: "<AZ1C_PUBLIC_CIDR_BLOCK>"
  PrivateSubnetCidrBlock1a:
    Type: "String"
    Default: "<AZ1A_PRIVATE_CIDR_BLOCK>"
  PrivateSubnetCidrBlock1c:
    Type: "String"
    Default: "<AZ1C_PRIVATE_CIDR_BLOCK>"
```

### Run aws command for cloud formation.

* Create stack
* Use "CAPABILITY_IAM" when use IAM and IAM Role.

```
aws cloudformation create-stack \
  --stack-name <STACK NAME> \
  --region ap-northeast-1 \
  --capabilities CAPABILITY_IAM \
  --template-body \
  [--capabilities CAPABILITY_IAM \]
  file://auto_scaling.yml
```

* Update stack

```
aws cloudformation update-stack \
  --stack-name <STACK NAME> \
  --region ap-northeast-1 \
  [--capabilities CAPABILITY_IAM \]
  --template-body \
  file://ec2.yml
```

* Delete stack

```
aws cloudformation delete-stack \
  --stack-name <STACK NAME>
```
---
