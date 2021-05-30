output "id" {
  value = {
    for k, v in snowflake_table_grant.grant : k => v.id
  }
}