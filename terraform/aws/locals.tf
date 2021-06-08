locals {
  snowflake_s3_bucket_name = "snowflake-${var.environment_namespace}-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  snowflake_s3_user        = "snowflake-${var.environment_namespace}-${data.aws_caller_identity.current.account_id}-user"
}
