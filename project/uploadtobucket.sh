#!/bin/bash

# Download the json file
# wget $1 -O payload.json

# Create the S3 bucket
terraform apply --auto-approve --var bucket_name=$2 --var url=$1

# Upload the json file
awslocal s3 cp payload.json s3://$2/

if [[ $? == 0 ]];
then
  rm payload.json
fi