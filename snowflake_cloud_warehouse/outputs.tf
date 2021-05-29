output "id" {
  value = {
    for k, v in snowflake_warehouse.warehouse : k => v.id
  }
}
