output "id" {
  value = {
    for k, v in snowflake_role.role : k => v.id
  }
}