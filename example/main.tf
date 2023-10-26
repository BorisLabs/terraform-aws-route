module "test_prefix_only" {
  source          = "../"
  route_table_ids = ["rtb-1234567890"]
  prefix_list_ids = ["pl-12345678"]
}

module "test_routes_only" {
  source          = "../"
  route_table_ids = ["rtb-1234567890"]
  routes          = ["192.168.0.1/32", "192.168.0.2/32"]
}


module "test_routes_and_prefixes" {
  source          = "../"
  route_table_ids = ["rtb-1234567890"]
  routes          = ["192.168.0.1/32", "192.168.0.2/32"]
  prefix_list_ids = ["pl-12345678"]
}