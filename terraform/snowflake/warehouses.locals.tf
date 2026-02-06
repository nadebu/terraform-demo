locals {
  warehouse_defaults = {
    warehouse_size       = "XSMALL"
    max_cluster_count    = 1
    min_cluster_count    = 1
    auto_suspend         = 60
    auto_resume          = true
    initially_suspended  = true
  }

  warehouses = {
    LOADER_WH = {}
    TRANSFORMER_WH    = {}
    READER_WH = {}
  }
}