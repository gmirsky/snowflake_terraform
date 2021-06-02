output "id" {
  value = {
    for k, v in snowflake_pipe.pipe : k => v.id
  }
}

output "sqs_notification_channel" {
  value = {
    for k, v in snowflake_pipe.pipe : k => v.notification_channel
  }
}

output "pipe_owner" {
  value = {
    for k, v in snowflake_pipe.pipe : k => v.owner
  }
}

