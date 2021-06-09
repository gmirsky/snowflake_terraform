output "snowflake_user_name" {
  value     = aws_iam_user.snowflake_user.name
  sensitive = false
}

output "snowflake_user_aws_iam_access_key" {
  value     = aws_iam_access_key.snowflake_user.id
  sensitive = false
}

output "snowflake_user_aws_iam_access_secret_key" {
  value     = aws_iam_access_key.snowflake_user.secret
  sensitive = true
}

output "snowflake_user_aws_iam_access_secret_key_encrypted" {
  value     = aws_iam_access_key.snowflake_user.encrypted_secret
  sensitive = false
}

output "snowflake_user_arn" {
  value     = aws_iam_user.snowflake_user.arn
  sensitive = false
}

output "s3_bucket_arn" {
  value     = module.s3-bucket.s3_bucket_arn
  sensitive = false
}

output "s3_bucket_id" {
  value     = module.s3-bucket.s3_bucket_id
  sensitive = false
}

output "bucket_object_id" {
  value = {
    for k, v in aws_s3_bucket_object.snowflake_folders : k => v.id
  }
}

output "bucket_object_urls" {
  value = {
    for k, v in aws_s3_bucket_object.snowflake_folders : k => "s3://${module.s3-bucket.s3_bucket_id}/${v.key}" 
  }
}