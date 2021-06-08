resource "snowflake_database" "database" {
  comment                     = each.value.comment
  data_retention_time_in_days = each.value.data_retention_time_in_days
  for_each                    = var.database
  from_database               = each.value.from_database
  from_share                  = each.value.from_share
  name                        = each.key
}