#!/usr/bin/env bash

if ! terraform init -upgrade; then
    echo $?
    echo
    echo "An error was encountered with the 'terraform init -upgrade' command"
    exit
fi
#
if ! terraform fmt -recursive; then
    echo $?
    echo
    echo "An error was encountered with the 'terraform fmt -recursive' command"
    exit
fi
#
if ! terraform validate; then
    echo $?
    echo
    echo "An error was encountered with the 'terraform validate' command"
    exit
fi
#
if ! terraform plan -out=tfplan -var-file=terraform.tfvars -var-file=snowflake.tfvars; then
    echo $?
    echo
    echo "An error was encountered with the 'terraform plan -out=tfplan -var-file=terraform.tfvars -var-file=snowflake.tfvars' command"
    exit
fi
#
terraform apply tfplan
#
# terraform destroy -var-file=terraform.tfvars -var-file=snowflake.tfvars