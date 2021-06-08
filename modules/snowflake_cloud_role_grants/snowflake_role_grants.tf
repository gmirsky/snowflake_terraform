resource "snowflake_role_grants" "role_grants" {
  for_each  = var.role_grants
  role_name = each.key
  users     = each.value.users
}