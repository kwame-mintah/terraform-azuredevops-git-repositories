output "git_repositories_repo_attr" {
  description = <<-EOF
    Name for all git repositories within the project.

EOF

  value = module.git_repositories.git_repos_attributes
}
