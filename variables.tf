variable "warehouse_size_default" {
  type        = string
  description = "Snowflake Warehouse size"
  default     = "xsmall"
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
  description = "Schema map used by the for_each loop in snowflake_cloud_schema modfule"
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

variable "view" {
  type        = map(any)
  description = "View map used by the for_each loop in snowflake_cloud_view module"
  default     = {}
  sensitive   = false
}

variable "default_user_password" {
  type        = string
  description = "Default user password"
  default     = "ChangeMe1st!"
  sensitive   = true
}