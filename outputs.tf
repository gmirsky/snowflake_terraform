output "snowflake_svc_public_key" {
  value       = module.snowflake_cloud_user.snowflake_svc_public_key
  description = "The SVC public key"
  sensitive   = false
}

output "snowflake_svc_public_key_openssh" {
  value       = module.snowflake_cloud_user.snowflake_svc_public_key_openssh
  description = "The OpenSSH public key"
  sensitive   = false
}

output "snowflake_svc_public_key_fingerprint_md5" {
  value       = module.snowflake_cloud_user.snowflake_svc_public_key_fingerprint_md5
  description = "The SVC public key MD5 finerprint"
  sensitive   = false
}

output "snowflake_svc_private_key" {
  value     = module.snowflake_cloud_user.snowflake_svc_private_key
  sensitive = true
}

output "database_id" {
  value     = module.snowflake_cloud_database.id
  sensitive = false
}

output "warehouse_id" {
  value     = module.snowflake_cloud_warehouse.id
  sensitive = false
}

output "warehouse_grant_id" {
  value     = module.snowflake_cloud_warehouse_grant.id
  sensitive = false
}

output "role_id" {
  value     = module.snowflake_cloud_role.id
  sensitive = false
}

output "schema_id" {
  value     = module.snowflake_cloud_schema.id
  sensitive = false
}
output "schema_grant_id" {
  value     = module.snowflake_cloud_schema_grant.id
  sensitive = false
}

output "database_grant_id" {
  value     = module.snowflake_cloud_database_grant.id
  sensitive = false
}

output "role_grants_id" {
  value     = module.snowflake_cloud_role_grants.id
  sensitive = false
}

output "table_id" {
  value     = module.snowflake_cloud_table.id
  sensitive = false
}

output "aws_account_id" {
  value     = data.aws_caller_identity.current.account_id
  sensitive = false
}

output "aws_caller_arn" {
  value     = data.aws_caller_identity.current.arn
  sensitive = false
}

output "aws_caller_user" {
  value     = data.aws_caller_identity.current.user_id
  sensitive = false
}

output "snowflake_user" {
  value     = aws_iam_user.snowflake_user.name
  sensitive = false
}

output "snowflake_user_arn" {
  value     = aws_iam_user.snowflake_user.arn
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

# output "view_id" {
#   value     = module.snowflake_cloud_view.id
#   sensitive = false
# }

# output "table_grant_id" {
#   value     = module.snowflake_cloud_table_grant.id
#   sensitive = false
# }

output "stage_s3_urls" {
  value     = local.stage_s3_urls
  sensitive = false
}

output "snowflake_cloud_stage_id" {
  value     = module.snowflake_cloud_stage.id
  sensitive = false
}

output "snowflake_cloud_stage_name" {
  value     = module.snowflake_cloud_stage.name
  sensitive = false
}

output "snowflake_cloud_stage_url" {
  value     = module.snowflake_cloud_stage.url
  sensitive = false
}

output "snowflake_cloud_pipe_id" {
  value     = module.snowflake_cloud_pipe.id
  sensitive = false
}

output "snowflake_cloud_pipe_sqs_notification_channel" {
  value     = module.snowflake_cloud_pipe.sqs_notification_channel
  sensitive = false
}

output "snowflake_cloud_pipe_pipe_owner" {
  value     = module.snowflake_cloud_pipe.pipe_owner
  sensitive = false
}
