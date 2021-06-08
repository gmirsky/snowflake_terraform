resource "snowflake_schema_grant" "schema_grant" {
  for_each          = var.schema_grant
  database_name     = element(split(".", each.key), 0)
  schema_name       = element(split(".", each.key), 1)
  privilege         = each.value.privilege
  roles             = each.value.roles
  shares            = each.value.shares
  with_grant_option = each.value.with_grant_option
}
