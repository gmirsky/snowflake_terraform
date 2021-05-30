# Snowflake Terraform

Terraform scripts and modules to provision Snowflake Cloud assets and the corresponding AWS S3 bucket, IAM policy and roles for Snowflake Stage and Snowflake Pipe.

This is currently a work in progress. Do not use!

Tested with Terraform version 15.4

```bash
terraform init

terraform fmt -recursive

terraform validate

terraform plan -out=tfplan

terraform apply "tfplan"
```

The AWS IAM encrypted secret key for the Snowflake user, denoted by "snowflake_user_aws_iam_access_secret_key_encrypted" may be decrypted using the command line command, for example:

```bash
terraform output -raw encrypted_secret | base64 --decode | keybase pgp decrypt
```
