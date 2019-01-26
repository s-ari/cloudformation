#!/bin/bash

# Add your s3 bucket url.
s3_bucket="<s3://your_bucket_name/>"
templates="<your templete path>"

yaml=(
ec2.yml
elasticache.yml
autoscale.yml
vpc.yml
elb.yml
)


for i in ${yaml[@]};
do
  aws s3 cp ${template}/${i} ${s3_bucket}
done
