variable "project_name" {
  description = "GCP Project name"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-central1-a"
}

variable "mysql_version" {
  description = "MySQL Version"
  type        = string
  default     = "MYSQL_8_0"
}

variable "mysql_instance_tier" {
  description = "MySQL Instance Tier"
  type = string
  default = "db-f1-micro"
}
