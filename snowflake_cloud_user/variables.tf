variable "users" {
  type        = map(any)
  description = "User map used by the for_each loop in snowflake_user"
  default     = {}
}

variable "default_user_password" {
  type        = string
  description = "Default user password"
  default     = "ChangeMe1st!"
}