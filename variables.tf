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

variable "route_table_ids" {
  description = "Route table IDs to add routes to."
  default     = null
  type        = list(string)
}

variable "prefix_list_ids" {
  description = "IDs of managed prefix lists to add routes for"
  default     = []
  type        = list(string)
}
