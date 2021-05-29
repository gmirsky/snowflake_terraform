resource "snowflake_role" "role" {
  comment  = each.value.comment
  for_each = var.role
  name     = each.key
}
