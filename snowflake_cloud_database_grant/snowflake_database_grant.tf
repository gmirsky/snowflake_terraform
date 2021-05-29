resource "snowflake_database_grant" "grant" {
  for_each          = var.database_grant
  database_name     = each.key
  privilege         = each.value.privilege
  roles             = each.value.roles
  shares            = each.value.shares
  with_grant_option = each.value.with_grant_option
}
