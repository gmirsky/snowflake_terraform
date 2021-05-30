output "id" {
  value = {
    for k, v in snowflake_stage.stage : k => v.id
  }
}