output "id" {
  value = {
    for k, v in snowflake_view.view : k => v.id
  }
}