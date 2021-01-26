variable "route_table_lookup_tags" {
  description = "Map of tags to lookup Route Table"
  default     = {}
  type        = map(string)
}

variable "routes" {
  description = "List of routes to be added to route table"
  default     = []
  type        = list(string)
}

variable "transit_gateway_id" {
  description = "ID of Transit Gateway to associate route to"
  default     = ""
}

variable "route_table_id" {
  description = "Route table ID to search for"
  default     = null
  type        = string
}
