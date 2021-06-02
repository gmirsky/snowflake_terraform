variable "aws_region" {
  type        = string
  description = "AWS acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "snowflake_region" {
  type        = string
  description = "Snowflake acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "warehouse_size_default" {
  type        = string
  description = "Snowflake Warehouse size"
  default     = "xsmall"
  sensitive   = false
}

variable "snowflake_account_type" {
  type        = string
  default     = "standard"
  description = "Snowflake account type (standard, enterprise, business_critical, vps)"
  sensitive   = false
  validation {
    condition = can(
      regex(
        "standard|enterprise|business_critical|vps",
        var.snowflake_account_type
      )
    )
    error_message = "ERROR: Snowflake account type must be of type: standard, enterprise, business_critical, vps."
  }
}

variable "environment_namespace" {
  type        = string
  description = "Environment namespace (demo, dev, test, qa, prod)"
  default     = "demo"
  sensitive   = false
  validation {
    condition = can(
      regex(
        "demo|dev|test|qa|prod",
        var.environment_namespace
      )
    )
    error_message = "ERROR: environment must be of type: dev, test, qa, prod."
  }
}

variable "custom_tags" {
  description = "Custom tags to be included"
  type        = map(any)
  sensitive   = false
}

variable "users" {
  type        = map(any)
  description = "User map used by the for_each loop in snowflake_cloud_user module"
  default     = {}
  sensitive   = false
}

variable "database" {
  type        = map(any)
  description = "Database map used by the for_each loop in snowflake_cloud_database module"
  default     = {}
  sensitive   = false
}

variable "database_grant" {
  type        = map(any)
  description = "Database grant map used by the for_each loop in snowflake_cloud_database_grant module"
  default     = {}
  sensitive   = false
}

variable "schema" {
  type        = map(any)
  description = "Schema map used by the for_each loop in snowflake_cloud_schema module"
  default     = {}
  sensitive   = false
}

variable "schema_grant" {
  type        = map(any)
  description = "Schema grants map used by the for_each loop in snowflake_cloud_schema_grants module"
  default     = {}
  sensitive   = false
}

variable "role" {
  type        = map(any)
  description = "Roles map used by the for_each loop in snowflake_cloud_roles module"
  default     = {}
  sensitive   = false
}

variable "role_grants" {
  type        = map(any)
  description = "Role grants map used by the for_each loop in snowflake_cloud_role_grant module"
  default     = {}
  sensitive   = false
}

variable "warehouse" {
  type        = map(any)
  description = "Warehouse map used by the for_each loop in snowflake_cloud_warehouse module"
  default     = {}
  sensitive   = false
}

variable "warehouse_grant" {
  type        = map(any)
  description = "Warehouse grants map used by the for_each loop in snowflake_cloud_warehouse_grant module"
  default     = {}
  sensitive   = false
}

variable "table" {
  type        = map(any)
  description = "Table map used by the for_each loop in snowflake_cloud_table module"
  default     = {}
  sensitive   = false
}

variable "table_grant" {
  type        = map(any)
  description = "Table grant map used by the for_each loop in snowflake_cloud_table_grant module"
  default     = {}
  sensitive   = false
}

variable "view" {
  type        = map(any)
  description = "View map used by the for_each loop in snowflake_cloud_view module"
  default     = {}
  sensitive   = false
}

# variable "stage" {
#   type        = map(any)
#   description = "Stage map used by the for_each loop in snowflake_cloud_stage module"
#   default     = {}
#   sensitive   = false
# }

# variable "stage_grant" {
#   type        = map(any)
#   description = "Stage grant map used by the for_each loop in snowflake_cloud_stage_grant module"
#   default     = {}
#   sensitive   = false
# }

variable "s3_bucket_folder_name" {
  type        = list(string)
  description = "folders name(s) to create so that snowflake can access"
  default     = []
  sensitive   = false
}

variable "stage_database" {
  type        = string
  description = "Snowflake stage database"
  default     = ""
  sensitive   = false
}

variable "stage_schema" {
  type        = string
  description = "Snowflake stage schema"
  default     = ""
  sensitive   = false
}

variable "pipe" {
  type        = map(any)
  description = "Pipe map used by the for_each loop in snowflake_cloud_pipe module"
  default     = {}
  sensitive   = false
}

variable "snowflake_resource_monitor_credit_quota" {
  type        = number
  description = "Snowflake resource monitor credit quota (default = 5)"
  default     = 5
  sensitive   = false
}

variable "snowflake_resource_monitor_frequency" {
  type        = string
  description = "Snowflake resource monitor frequency (default = DAILY)"
  default     = "DAILY"
  sensitive   = false
}

variable "snowflake_resource_monitor_notify_triggers" {
  type        = list(number)
  description = "Snowflake resource monitor notify trigger thresholds"
  default     = [85, 90, 95]
}

variable "snowflake_resource_monitor_suspend_triggers" {
  type        = list(number)
  description = "Snowflake resource monitor suspend trigger thresholds"
  default     = [100]
}

variable "snowflake_resource_monitor_suspend_immediate_triggers" {
  type        = list(number)
  description = "Snowflake resource monitor suspend immediate trigger thresholds"
  default     = [101, 105, 110]
}


