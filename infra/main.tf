resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "spotmusic"
  description = "Docker Images for SpotMusic"
  format = "DOCKER"
}

resource "google_sql_database" "database-prod" {
  name     = "spotmusic-production"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database" "database-staging" {
  name     = "spotmusic-staging"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "spotmusic-instance"
  region           = var.region
  database_version = var.mysql_version
  settings {
    tier = var.mysql_instance_tier
  }

  deletion_protection  = "true"
}

resource "google_secret_manager_secret" "secrets" {
  secret_id = "spotmusic-secrets"

  labels = {
    label = "app-secrets"
  }

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
      replicas {
        location = "us-east1"
      }
    }
  }
}