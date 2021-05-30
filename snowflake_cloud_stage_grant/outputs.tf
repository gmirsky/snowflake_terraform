output "id" {
  value = {
    for k, v in snowflake_stage_grant.stage_grant : k => v.id
  }
}