locals {
  init_git_repositories = [
    {
      name           = "module-git-repositories",
      default_branch = "refs/head/main"
      source_type    = "Git",
      source_url     = "https://github.com/kwame-mintah/terraform-azuredevops-git-repositories.git",
      init_type      = "Import",
    },
    {
      name           = "empty-repository"
      default_branch = "refs/head/master"
      source_type    = null
      source_url     = null
      init_type      = "Clean"
  }]
}

data "azuredevops_project" "project" {
  name = "Example"
}

module "git_repositories" {
  source                = "../.."
  project_name          = data.azuredevops_project.project.name
  init_git_repositories = local.init_git_repositories
}
