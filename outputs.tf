output "git_repos_attributes" {
  description = <<-EOF
    Retrieve the git repository attributes.

EOF

  value = data.azuredevops_git_repository.repo_attr[*]
}
