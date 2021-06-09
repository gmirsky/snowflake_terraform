resource "snowflake_stage_grant" "stage_grant" {
  for_each      = var.stage_name
  database_name = var.database_name
  schema_name   = var.schema_name
  roles         = var.roles
  privilege     = var.privilege
  stage_name    = each.value
}
