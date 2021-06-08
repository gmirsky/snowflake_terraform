resource "snowflake_schema" "schema" {
  for_each            = var.schema
  name                = each.key
  database            = each.value.database
  comment             = each.value.comment
  is_managed          = each.value.is_managed
  is_transient        = each.value.is_transient
  data_retention_days = each.value.data_retention_days
}