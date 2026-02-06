resource "snowflake_warehouse" "warehouses" {
  for_each = local.warehouses

  name                      = each.key

  warehouse_size            = local.warehouse_defaults.warehouse_size
  max_cluster_count         = local.warehouse_defaults.max_cluster_count
  min_cluster_count         = local.warehouse_defaults.min_cluster_count
  auto_suspend              = local.warehouse_defaults.auto_suspend
  auto_resume               = local.warehouse_defaults.auto_resume
  initially_suspended       = local.warehouse_defaults.initially_suspended
}