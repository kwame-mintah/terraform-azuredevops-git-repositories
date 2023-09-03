variable "project_name" {
  description = <<-EOF
    Name of the Project.
EOF

  type = string
}

variable "init_git_repositories" {
  description = <<-EOF
    (Optional) Names of git repositories to add into the 
    project.

EOF

  type = list(object({
    name        = string
    source_type = string
    source_url  = string
    init_type   = string
  }))
  default = []
}

variable "git_default_branch" {
  description = <<-EOF
    The ref of the default branch. 
    Will be used as the branch name for initialized repositories.
EOF

  type    = string
  default = "refs/heads/main"
}
