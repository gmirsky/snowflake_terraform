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

output "view_id" {
  value     = module.snowflake_cloud_view.id
  sensitive = false
}
