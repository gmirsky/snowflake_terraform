variable "users" {
  type        = map(any)
  description = "User map used by the for_each loop in snowflake_user"
  default     = {}
  sensitive   = false
}

variable "default_user_password" {
  type        = string
  description = "Default user password"
  default     = ""
  sensitive   = true
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
