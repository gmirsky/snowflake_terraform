output "id" {
  value = {
    for k, v in snowflake_database.database : k => v.id
  }
}