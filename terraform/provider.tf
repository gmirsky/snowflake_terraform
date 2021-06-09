provider "aws" {
  region = var.aws_region
}

provider "snowflake" {
  role     = var.snowflake_role
  username = var.snowflake_username
  account  = var.snowflake_account
  region   = var.snowflake_region
  password = var.snowflake_password
}