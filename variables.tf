variable "bucket_name" {
  description = "Name of the bucket to be created"
  type        = string
  default     = "sreyas-123"
}
variable "github_token" {
  description = "The GitHub personal access token"
  type        = string
}

variable "repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "repo_description" {
  description = "Description of the GitHub repository"
  type        = string
}
