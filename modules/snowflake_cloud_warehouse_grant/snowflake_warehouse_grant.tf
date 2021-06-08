resource "snowflake_warehouse_grant" "warehouse_grant" {
  warehouse_name    = each.key
  privilege         = each.value.privilege
  for_each          = var.warehouse_grant
  roles             = each.value.roles
  with_grant_option = each.value.with_grant_option
}
