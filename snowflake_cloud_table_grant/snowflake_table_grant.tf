resource "snowflake_table_grant" "grant" {
  for_each          = var.table_grant
  database_name     = element(split(".", each.key), 0)
  schema_name       = element(split(".", each.key), 1)
  table_name        = element(split(".", each.key), 2)
  privilege         = each.value.privilege
  roles             = each.value.roles
  shares            = each.value.shares
  with_grant_option = each.value.with_grant_option
}
