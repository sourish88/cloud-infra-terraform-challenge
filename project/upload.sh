#!/bin/bash

# Download the json file
wget $1 -O payload.json

# Create the S3 bucket
terraform apply --auto-approve

# Upload the json file
awslocal s3 cp payload.json s3://daily/

if [[ $? == 0 ]];
then
  rm payload.json
fi