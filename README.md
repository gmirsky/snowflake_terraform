# Snowflake Terraform

Terraform scripts and modules to provision Snowflake Cloud assets and the corresponding AWS S3 bucket, IAM policy and roles for Snowflake Stage and Snowflake Pipe.

This is currently a work in progress. Do not use!

Tested with Terraform version 15.4

You must alter your Snowflake user with the following command via the console before trying to use this Terraform scrpit

```sql
ALTER USER my_terraform_account_admin_user_id SET QUOTED_IDENTIFIERS_IGNORE_CASE = true;
```


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
