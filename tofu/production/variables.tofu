variable "cloudflare_account_id" {
  description = "ID of the cloudflare account"
  type        = string
}

variable "repository_url" {
  description = "HTML URL of this git repository"
  type        = string
  default     = ""
}

variable "homepage_url" {
  description = "The web address of the project"
  type        = string
}
