output "snowflake_user_name" {
  value     = module.snowflake_cloud_aws.snowflake_user_name
  sensitive = false
}

output "snowflake_user_aws_iam_access_key" {
  value     = module.snowflake_cloud_aws.snowflake_user_aws_iam_access_key
  sensitive = false
}

output "snowflake_user_aws_iam_access_secret_key" {
  value     = module.snowflake_cloud_aws.snowflake_user_aws_iam_access_secret_key
  sensitive = true
}

output "snowflake_user_aws_iam_access_secret_key_encrypted" {
  value     = module.snowflake_cloud_aws.snowflake_user_aws_iam_access_secret_key_encrypted
  sensitive = false
}

output "snowflake_user_arn" {
  value     = module.snowflake_cloud_aws.snowflake_user_arn
  sensitive = false
}

output "s3_bucket_arn" {
  value     = module.snowflake_cloud_aws.s3_bucket_arn
  sensitive = false
}
