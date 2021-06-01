locals {
  snowflake_s3_bucket_name = "snowflake-${var.environment_namespace}-${data.aws_caller_identity.current.account_id}"
  snowflake_s3_user        = "snowflake-${var.environment_namespace}-${data.aws_caller_identity.current.account_id}-user"
  #
  s3_bucket_folder_name         = toset(var.s3_bucket_folder_name)
  snowflake_s3_user_credentials = "AWS_KEY_ID='${aws_iam_access_key.snowflake_user.id}' AWS_SECRET_KEY='${aws_iam_access_key.snowflake_user.secret}'"
}
