# Snowflake AWS Terraform

## Warning

This is still a work in progress. Do not use. Refactoring in progress.

## Description

Terraform scripts and modules to provision a databases, schemas, tables, warehouses, roles, resource monitor, stages and pipes in Snowflake Cloud. The Terraform scripts will also provision a AWS S3 bucket for data loading and the user and permissions Snowflake will use to connect to the account.

The Terraform modules are genericized to use multi-level map variables to provision the Snowflake assets. Below is a sample of the terraform.tfvars that provions four test users and assigns them to a default role and data warehouse.

```json
users = {
  "terraform_test_user_1" = {
    login_name        = "terraform_test_user_1"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_1"
    email             = "user1@donotreply.com"
    first_name        = "user"
    last_name         = "one"
    role              = "test_role_transformer"
    default_namespace = "test_database_1"
    warehouse         = "test_transformer_warehouse"
  }
  "terraform_test_user_2" = {
    login_name        = "terraform_test_user_2"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_2"
    email             = "user2@donotreply.com"
    first_name        = "user"
    last_name         = "two"
    role              = "test_role_transformer"
    default_namespace = "test_database_1"
    warehouse         = "test_transformer_warehouse"
  }
  "terraform_test_user_3" = {
    login_name        = "terraform_test_user_3"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_3"
    email             = "user3@donotreply.com"
    first_name        = "user"
    last_name         = "three"
    role              = "test_role_transformer"
    default_namespace = "test_database_1"
    warehouse         = "test_transformer_warehouse"
  }
  "terraform_test_user_4" = {
    login_name        = "terraform_test_user_4"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_4"
    email             = "user4@donotreply.com"
    first_name        = "user"
    last_name         = "four"
    role              = "test_role_loader"
    default_namespace = "test_database_1"
    warehouse         = "test_loader_warehouse"
  }
}
```

## Testing

Tested with Terraform version 15.5 and the following providers:

+ provider registry.terraform.io/chanzuckerberg/snowflake v0.25.5
+ provider registry.terraform.io/hashicorp/aws v3.45.0
+ provider registry.terraform.io/hashicorp/random v3.1.0
+ provider registry.terraform.io/hashicorp/template v2.2.0
+ provider registry.terraform.io/hashicorp/tls v3.1.0

## Prerequisites

You must alter your Snowflake user with the following command via the console before trying to use this Terraform script.

```sql
ALTER USER my_terraform_account_admin_user_id SET QUOTED_IDENTIFIERS_IGNORE_CASE = true;
```

## Run Instructions

```bash
terraform init -upgrade

terraform fmt -recursive

terraform validate

terraform plan -out=tfplan

terraform apply "tfplan"
```

## Post Processing

The AWS IAM encrypted secret key for the Snowflake user, denoted by "snowflake_user_aws_iam_access_secret_key_encrypted" may be decrypted using the command line command, for example:

```bash
terraform output -raw encrypted_secret | base64 --decode | keybase pgp decrypt
```

## Test Data Generation

The `python/test_data_creation` folder contains some basic python faker programs to generate test data for use with the Snowflake Snow Pipe. Create the files and then upload the appropraite file types to the AWS S3 bucket this Terraform script creates to test the auto ingestion of data into the Snowflake data warehouse tables.

## Removal

To remove all Snowflake and AWS assets created by this script run the following command:

```bash
terraform destroy
```
