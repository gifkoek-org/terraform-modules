locals {
  # Auto-generated
  topic_teams = [for team in var.owner_teams : "team-${team}"]
  topics      = var.topic != "" ? concat(["constellation-${var.topic}"], local.topic_teams) : local.topic_teams
  # All owner teams should also be writers
  writer_teams = distinct(concat(var.writer_teams, var.owner_teams))
}

# -----------------------------
# module definition
# -----------------------------

data "github_team" "writer_teams" {
  for_each = toset(local.writer_teams)
  slug     = each.value
}

# repo definition, most features are disabled
resource "github_repository" "github_repo" {
  name               = var.name
  description        = var.description
  private            = false
  has_wiki           = false
  has_downloads      = false
  has_issues         = false
  has_projects       = false
  archived           = var.archived
  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge
  topics             = local.topics
  # init the repo with a master branch and README.md
  auto_init              = var.auto_init
  delete_branch_on_merge = var.delete_branch_on_merge

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_team_repository" "writer_teams" {
  for_each   = toset(values(data.github_team.writer_teams)[*].id)
  repository = github_repository.github_repo.name
  team_id    = each.value
  permission = "push"
}

# set protection on the master branch
# settings are:
# - admins are not exempt
# - stale reviews dismissed if a PR is updated
# - defined number of reviewers required
# - only writer team can dismiss
# - status checks must pass
# - only the defined repo owner teams can push
resource "github_branch_protection" "master" {
  branch         = "master"
  repository     = github_repository.github_repo.name
  enforce_admins = true

  required_status_checks {
    strict   = var.strict
    contexts = var.required_status_checks
  }
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = var.review_count
    require_code_owner_reviews      = true
    dismissal_teams                 = var.owner_teams

  }

  restrictions {
    teams = var.owner_teams
  }
}
