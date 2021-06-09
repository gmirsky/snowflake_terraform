variable "aws_region" {
  type        = string
  description = "AWS acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "custom_tags" {
  description = "Custom tags to be included"
  type        = map(any)
  sensitive   = false
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

variable "s3_bucket_folder_name" {
  type        = list(string)
  description = "folders name(s) to create so that snowflake can access"
  default     = []
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

variable "snowflake_region" {
  type        = string
  description = "Snowflake acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "snowflake_role" {
  type        = string
  description = "Snowflake role to run as"
  sensitive   = false
}

variable "snowflake_username" {
  type        = string
  description = "Snowflake user name to run as"
  sensitive   = false
}

variable "snowflake_account" {
  type        = string
  description = "Snowflake account to run against"
  sensitive   = false
}

variable "snowflake_password" {
  type        = string
  description = "Snowflake user password"
  sensitive   = true
}
