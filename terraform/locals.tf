locals {
  snowflake_s3_bucket_name      = "snowflake-${var.environment_namespace}-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  snowflake_s3_user             = "snowflake-${var.environment_namespace}-${data.aws_caller_identity.current.account_id}-user"
  snowflake_s3_user_credentials = "AWS_KEY_ID='${module.snowflake_cloud_aws.snowflake_user_aws_iam_access_key}' AWS_SECRET_KEY='${module.snowflake_cloud_aws.snowflake_user_aws_iam_access_secret_key}'"
  stage_s3_urls = {
    for k, v in module.snowflake_cloud_aws.bucket_object_id : k => "s3://${local.snowflake_s3_bucket_name}/${k}"
  }
}
