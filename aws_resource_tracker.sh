#!/bin/bash
#
######################################
##Author :Vinayak
##Date:13 nov
##
## Version :v1
##
##This script will report the AWS resource usage
##############################################################
#
##AWS S3
##AWS EC2
##AWS Lambda
##AWS IAM users
##############################
set -x

##List S3 bucket
echo "print list of S3 Bucket"
aws s3 ls >> :wq!resourcetracker

## List EC2 instances
echo "print list of EC2 instance"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourcetracker

#List lambda
echo "print list of lambda function"
aws lambda list-functions >> resourcetracker

#List IAM users
echo "print list IAM Users"
aws iam list-users >> resourcetracker

## integrate this code with crontab    it is a task