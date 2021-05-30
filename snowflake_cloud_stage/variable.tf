variable "stage" {
  type        = map(any)
  description = "Stage map used by the for_each loop in snowflake_stage"
  default     = {}
  sensitive   = false
}