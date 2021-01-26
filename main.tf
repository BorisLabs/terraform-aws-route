data "aws_route_table" "this" {
  tags           = var.route_table_lookup_tags
  route_table_id = var.route_table_id
}

resource "aws_route" "to_tgw" {
  count                  = length(var.routes)
  route_table_id         = data.aws_route_table.this.id
  transit_gateway_id     = var.transit_gateway_id
  destination_cidr_block = var.routes[count.index]
}
