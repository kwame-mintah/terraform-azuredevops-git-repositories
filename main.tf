# Git Repositories Module -----------------------
# -----------------------------------------------
data "azuredevops_project" "project" {
  name = var.project_name
}

# Retrieves data about Azure DevOps Git repositories using a dynamic data block, 
# iterating over the elements in the "init_git_repositories" variable. 
# It specifies the project ID, repository name, and there is an dependency on an existing 
# resource named "azuredevops_git_repository.repo".
data "azuredevops_git_repository" "repo_attr" {
  for_each   = { for key, value in var.init_git_repositories : key => value }
  project_id = data.azuredevops_project.project.id
  name       = each.value.name
  depends_on = [azuredevops_git_repository.repo]
}

# Creates Azure DevOps Git repositories based on the configuration specified in the 
# "init_git_repositories" variable. It defines properties such as the project ID, 
# repository name, default branch, and initialization settings, allowing for customization 
# of the repository creation process. It also ignores changes to the initialization settings 
# for better management of existing repositories.
resource "azuredevops_git_repository" "repo" {
  for_each       = { for key, value in var.init_git_repositories : key => value }
  project_id     = data.azuredevops_project.project.id
  name           = each.value.name
  default_branch = var.git_default_branch
  initialization {
    init_type   = each.value.init_type
    source_type = each.value.source_type
    source_url  = each.value.source_url
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes to initialization to support importing existing repositories
      # Given that a repo now exists, either imported into terraform state or created by terraform,
      # we don't care for the configuration of initialization against the existing resource
      initialization,
    ]
  }
}
