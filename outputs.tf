output "snowflake_svc_public_key" {
  value     = module.snowflake_cloud_user.snowflake_svc_public_key
  sensitive = false
}

output "snowflake_svc_public_key_openssh" {
  value     = module.snowflake_cloud_user.snowflake_svc_public_key_openssh
  sensitive = false
}

output "snowflake_svc_public_key_fingerprint_md5" {
  value     = module.snowflake_cloud_user.snowflake_svc_public_key_fingerprint_md5
  sensitive = false
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

output "database_grant_id" {
  value     = module.snowflake_cloud_database_grant.id
  sensitive = false
}

output "role_grants_id" {
  value     = module.snowflake_cloud_role_grants.id
  sensitive = false
}