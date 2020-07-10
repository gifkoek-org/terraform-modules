output "repository_ssh_url" {
  description = "Repository's SSH clone URL"
  value       = "${github_repository.github_repo.ssh_clone_url}"
}

output "repository_http_url" {
  description = "Repository's HTTPS clone URL"
  value       = "${github_repository.github_repo.http_clone_url}"
}
