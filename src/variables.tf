variable "name" {
  description = "Name of the Netlify site"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.name))
    error_message = "Site name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "repo_url" {
  description = "Repository URL for continuous deployment"
  type        = string
}

variable "repo_branch" {
  description = "Branch to deploy from"
  type        = string
  default     = "main"
}

variable "build_command" {
  description = "Build command to run"
  type        = string
  default     = ""
}

variable "publish_dir" {
  description = "Directory to publish"
  type        = string
  default     = "public"
}

variable "environment_variables" {
  description = "Environment variables for builds"
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "custom_domain" {
  description = "Custom domain for the site"
  type        = string
  default     = null
}

variable "deploy_previews" {
  description = "Enable deploy previews for pull requests"
  type        = bool
  default     = true
}

variable "branch_deploys" {
  description = "Enable branch deploys"
  type        = bool
  default     = false
}

variable "functions_dir" {
  description = "Directory containing Netlify Functions"
  type        = string
  default     = null
}

variable "build_image" {
  description = "Build image to use (e.g., 'focal', 'jammy')"
  type        = string
  default     = "focal"

  validation {
    condition     = contains(["xenial", "focal", "jammy"], var.build_image)
    error_message = "Build image must be one of: xenial, focal, jammy."
  }
}

variable "stop_builds" {
  description = "Stop all builds for this site"
  type        = bool
  default     = false
}

variable "repo_provider" {
  description = "Git provider (github, gitlab, bitbucket)"
  type        = string
  default     = "github"

  validation {
    condition     = contains(["github", "gitlab", "bitbucket"], var.repo_provider)
    error_message = "Repo provider must be one of: github, gitlab, bitbucket."
  }
}

variable "repo_deploy_key_id" {
  description = "Deploy key ID for private repositories"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the site"
  type        = map(string)
  default     = {}
}
