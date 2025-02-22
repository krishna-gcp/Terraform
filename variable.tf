variable "GOOGLE_CREDENTIALS" {
  description = "The base64-encoded GCP service account key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}
