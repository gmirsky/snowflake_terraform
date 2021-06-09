variable "roles" {
  type        = list(string)
  description = "Roles to be granted access to the stage"
}

variable "database_name" {
  type        = string
  description = "Name of the database that owns the stage"
}

variable "schema_name" {
  type        = string
  description = "Name of the schema that owns the stage"
}

variable "privilege" {
  type        = string
  default     = "USAGE"
  description = "Privilege to be granted"
}

variable "stage_name" {
  type        = map(any)
  description = "Map of stage names to grant access to"
}
