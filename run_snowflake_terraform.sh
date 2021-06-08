#!/usr/bin/env bash
#
# Build AWS assets such as AWS user for Snowflake to use and the S3 bucket 
# for Snow Pipe to use.
#
cd ~/snowflake_terraform/terraform/aws
pwd
if ! terraform init -upgrade; then
    echo $?
    echo "An error was encountered with the 'terraform init -upgrade' command"
    exit
fi
#
if ! terraform fmt -recursive; then
    echo $?
    echo "An error was encountered with the 'terraform fmt -recursive' command"
    exit
fi
#
if ! terraform validate; then
    echo $?
    echo "An error was encountered with the 'terraform validate' command"
    exit
fi
#
if ! terraform plan -out=tfplan; then
    echo $?
    echo "An error was encountered with the 'terraform plan -out=tfplan' command"
    exit
fi
#
#terraform apply tfplan
#
# 
#
cd /Users/gregorymirsky/snowflake_terraform
pwd
#
