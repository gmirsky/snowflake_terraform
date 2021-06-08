output "id" {
  value = {
    for k, v in snowflake_stage.stage : k => v.id
  }
}

output "name" {
  value = {
    for k, v in snowflake_stage.stage : k => v.name
  }
}

output "url" {
  value = {
    for k, v in snowflake_stage.stage : k => v.url
  }
}

