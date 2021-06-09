variable "warehouse" {
  type        = map(any)
  description = "Warehouse map used by the for_each loop in snowflake_warehouse"
  default     = {}
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
