output "id" {
  value = {
    for k, v in snowflake_database_grant.grant : k => v.id
  }
}