resource "snowflake_resource_monitor" "monitor" {
  name                       = local.snowflake_resource_monitor_name
  credit_quota               = var.snowflake_resource_monitor_credit_quota
  frequency                  = var.snowflake_resource_monitor_frequency
  start_timestamp            = formatdate("YYYY-MM-DD hh:mm", timeadd(timestamp(), "10m"))
  notify_triggers            = var.snowflake_resource_monitor_notify_triggers
  suspend_triggers           = var.snowflake_resource_monitor_suspend_triggers
  suspend_immediate_triggers = var.snowflake_resource_monitor_suspend_immediate_triggers
}
