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
