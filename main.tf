data "aws_route_table" "this" {
  count = length(var.route_table_lookup_tags) > 0 ? 1 : 0
  tags  = var.route_table_lookup_tags
}

locals {
  rtb_ids                    = concat(data.aws_route_table.this[*].id, var.route_table_ids)
  map_of_tables_and_routes   = merge(tolist(flatten([for id in local.rtb_ids : { for r in var.routes : "${id}_${r}" => { rtb_id = id, route = r } }]))...)
  map_of_tables_and_prefixes = merge(tolist(flatten([for id in local.rtb_ids : { for pl in var.prefix_list_ids : "${id}_${pl}" => { rtb_id = id, prefix_list_id = pl } }]))...)
  merged_routes              = merge(local.map_of_tables_and_routes, local.map_of_tables_and_prefixes)
}

resource "aws_route" "to_tgw" {
  for_each       = local.merged_routes
  route_table_id = lookup(each.value, "rtb_id")
  # only one of transit_gateway_id or vpc_peering_connection_id may be set. So if the vpc_peer_conn_id is set this will be null.
  transit_gateway_id         = var.vpc_peering_connection_id != "" ? null : var.transit_gateway_id
  destination_cidr_block     = lookup(each.value, "route", null)
  destination_prefix_list_id = lookup(each.value, "prefix_list_id", null)
  vpc_peering_connection_id  = var.vpc_peering_connection_id != "" ? var.vpc_peering_connection_id : null
}
