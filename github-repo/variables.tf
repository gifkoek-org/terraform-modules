# -----------------------------
# module variables
# -----------------------------
variable "name" {
  type        = string
  description = "Name for the repository"
}

variable "description" {
  type        = string
  description = "Description for the repository"
}

variable "review_count" {
  type        = number
  description = "Number of required reviewers for a PR"
  default     = 1
}

variable "writer_teams" {
  type        = list(string)
  description = "Teams that can write to this repository"
}

variable "owner_teams" {
  type        = list(string)
  description = "Teams that can write to the master branch of the repository"
}

variable "auto_init" {
  type        = bool
  default     = true
  description = "Auto-init. Should be explicitly set to false for repositories that haven't been created by Terraform"
}

variable "archived" {
  type        = bool
  default     = false
  description = "Defines if repository is archived"
}

variable "allow_merge_commit" {
  type        = bool
  default     = true
  description = "Allow merge commit"
}
variable "allow_squash_merge" {
  type        = bool
  default     = true
  description = "Allow squash merge"
}

variable "allow_rebase_merge" {
  type        = bool
  default     = true
  description = "Allow rebase merge"
}
variable "topic" {
  type        = string
  default     = ""
  description = "Topic"
}

variable "required_status_checks" {
  type        = list(string)
  default     = []
  description = "Required status checks"
}

variable "strict" {
  type        = bool
  default     = false
  description = "Require branches to be up to date before merging"
}

variable "delete_branch_on_merge" {
  type        = bool
  default     = false
  description = "Automatically delete head branch after a pull request is merged"
}

variable "visibility" {
  type        = string
  default     = "public"
  description = "Set public or privateness of the repo"
}

variable "primary_branch_name" {
  type        = string
  default     = "main"
  description = "Allow setting primary branch name to distinguish between old (master) and new (main) default naming convention"
}