# CloudFormation Stack

## Create AWS Resources using cloudformation stack.

### Upload cloudformation template to S3 bucket.

```
cd stack
aws s3 cp <ALL_YAML_FILE> s3://<YOUR_BUCKET_NAME>
```

### Edit parameters in root_stack.yml.

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
  AllowHttp:
    Type: "String"
    Default: "<ALLOW_HTTP_HOST_IP_ADDRESS>"
  Ec2InstanceType:
    Type: "String"
    Default: "<INSTANCE_TYPE>"
  AutoScaleInstanceType:
    Type: "String"
    Default: "<INSTANCE_TYPE>"
  ElastiCacheInstanceType:
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
  TemplateURL:
    Type: "String"
    Default:"<S3_BUCKET_NAME"＞
```

### Edit Mappings "true" or "false" for using resources.

```
Mappings:
  Resources:
    Vpc:
      Use: ""
    Ec2:
      Use: ""
    Elb:
      Use: ""
    AutoScale:
      Use: ""
    ElastiCache:
      Use: ""
```

### Run aws command for cloud formation.

* Create stack

```
aws cloudformation create-stack \
  --stack-name <STACK NAME> \
  --region ap-northeast-1 \
  --capabilities CAPABILITY_IAM \
  --template-body \
  file://root_stack.yml
```

* Update stack

```
aws cloudformation update-stack \
  --stack-name <STACK NAME> \
  --region ap-northeast-1 \
  --capabilities CAPABILITY_IAM \
  --template-body \
  file://root_stack.yml
```

* Delete stack

```
aws cloudformation delete-stack \
  --stack-name <STACK NAME>
```
---
