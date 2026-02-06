locals {
  databases = {
    RAW = {
      comment = "Raw ingested data"
    },
    ANALYTICS_DEV= {
      comment = "For development and testing of transformations and data models"
    },
    ANALYTICS= {
      comment = "Production analytics database"
    }
  }
}