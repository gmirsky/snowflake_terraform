output "id" {
  value = {
    for k, v in snowflake_schema_grant.schema_grant : k => v.id
  }
}