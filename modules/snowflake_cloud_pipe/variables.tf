variable "pipe" {
  type        = map(any)
  description = "Pipe map used by the for_each loop in snowflake_pipe"
  default     = {}
  sensitive   = false
}

variable "snowflake_region" {
  type        = string
  description = "Snowflake acccount region"
  default     = "us-east-1"
  sensitive   = false
}
