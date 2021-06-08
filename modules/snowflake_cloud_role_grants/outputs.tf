output "id" {
  value = {
    for k, v in snowflake_role_grants.role_grants : k => v.id
  }
}