resource "snowflake_stage" "stage" {
  for_each = var.stage_s3_urls
  name = trimsuffix(
    replace(
      replace(
        each.key
      , "-", "_")
    , "/", "_")
  , "_")
  url         = each.value
  database    = var.stage_database
  schema      = var.stage_schema
  credentials = var.stage_credentials
  comment     = "Stage created by Terraform"
}
