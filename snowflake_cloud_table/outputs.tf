output "id" {
  value = {
    for k, v in snowflake_table.table : k => v.id
  }
}