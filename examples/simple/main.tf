locals {
  init_git_repositories = [
    {
      name        = "module-git-repositories",
      source_type = "Git",
      source_url  = "https://github.com/kwame-mintah/terraform-azuredevops-git-repositories.git",
      init_type   = "Import",
    },
    {
      name        = "empty-repository"
      source_type = null
      source_url  = null
      init_type   = "Clean"
  }]
}

data "azuredevops_project" "project" {
  name = "Example"
}

module "git_repositories" {
  source                = "../.."
  project_name          = data.azuredevops_project.project.name
  git_default_branch    = "refs/heads/master"
  init_git_repositories = local.init_git_repositories
}
