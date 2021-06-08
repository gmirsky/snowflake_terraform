output "snowflake_user_name" {
  value = aws_iam_user.snowflake_user.name
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
