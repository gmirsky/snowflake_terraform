output "id" {
  value = {
    for k, v in snowflake_schema.schema : k => v.id
  }
}