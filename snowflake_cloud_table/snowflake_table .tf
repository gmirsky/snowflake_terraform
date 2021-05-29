resource "snowflake_table" "table" {
  for_each   = var.table
  name       = each.key
  database   = each.value.database
  comment    = each.value.comment
  schema     = each.value.schema
  cluster_by = each.value.cluster_by
  dynamic "column" {
    for_each = each.value.column
    content {
      name = column.value.name
      type = column.value.type
    }
  }
}