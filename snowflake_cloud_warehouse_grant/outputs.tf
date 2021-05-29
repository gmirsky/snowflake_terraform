output "id" {
  value = {
    for k, v in snowflake_warehouse_grant.warehouse_grant : k => v.id
  }
}