variable "pipe" {
  type        = map(any)
  description = "Pipe map used by the for_each loop in snowflake_pipe"
  default     = {}
  sensitive   = false
}