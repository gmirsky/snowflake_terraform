# resource "snowflake_stage_grant" "grant_example_stage" {
#   database_name = snowflake_stage.example_stage.database
#   schema_name   = snowflake_stage.example_stage.schema
#   roles         = ["LOADER"]
#   privilege     = "OWNERSHIP"
#   stage_name    = snowflake_stage.example_stage.name
# }