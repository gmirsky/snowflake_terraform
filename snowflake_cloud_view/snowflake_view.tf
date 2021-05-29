resource "snowflake_view" "view" {
  for_each   = var.view
  name       = each.key
  database   = each.value.database
  comment    = each.value.comment
  schema     = each.value.schema
  statement  = file("${path.module}/${each.value.sql_statement_path}")
  or_replace = false
  is_secure  = false
}