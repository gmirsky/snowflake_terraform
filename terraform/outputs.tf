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

output "s3_bucket_id" {
  value     = module.snowflake_cloud_aws.s3_bucket_id
  sensitive = false
}

output "s3_bucket_object_id" {
  value     = module.snowflake_cloud_aws.bucket_object_id
  sensitive = false
}

output "s3_bucket_object_urls" {
  value     = module.snowflake_cloud_aws.bucket_object_urls
  sensitive = false
}

output "snowflake_cloud_database_id" {
  value = module.snowflake_cloud_database.id
}

output "snowflake_cloud_database_grant_id" {
  value = module.snowflake_cloud_database_grant.id
}

output "snowflake_cloud_schema_id" {
  value = module.snowflake_cloud_schema.id
}

output "snowflake_cloud_schema_grant_id" {
  value = module.snowflake_cloud_schema_grant.id
}

output "snowflake_cloud_table_id" {
  value = module.snowflake_cloud_table.id
}

output "snowflake_cloud_stage_id" {
  value = module.snowflake_cloud_stage.id
}

output "snowflake_cloud_stage_name" {
  value = module.snowflake_cloud_stage.name
}

output "snowflake_cloud_stage_url" {
  value = module.snowflake_cloud_stage.url
}

