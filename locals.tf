locals {
  snowflake_s3_bucket_name        = "snowflake-${var.environment_namespace}-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  snowflake_s3_user               = "snowflake-${var.environment_namespace}-${data.aws_caller_identity.current.account_id}-user"
  snowflake_resource_monitor_name = "snowflake-${var.environment_namespace}-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  s3_bucket_folder_name           = toset(var.s3_bucket_folder_name)
  snowflake_s3_user_credentials   = "AWS_KEY_ID='${aws_iam_access_key.snowflake_user.id}' AWS_SECRET_KEY='${aws_iam_access_key.snowflake_user.secret}'"
  stage_s3_urls                   = { for k, v in aws_s3_bucket_object.snowflake_folders : k => "s3://${local.snowflake_s3_bucket_name}/${v.key}" }
}
