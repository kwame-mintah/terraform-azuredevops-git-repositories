# Terraform Azure DevOps Git Repositories

This module aids in the creation of multiple git repositories, within your Azure DevOps project.

## Usage

```hcl
module "git-repositories" {
  source  = "kwame-mintah/git-repositories/azuredevops"
  version = "0.2.0"
  init_git_repositories = [
    {
      name           = "import-repository",
      default_branch = "refs/head/main"
      source_type    = "Git",
      source_url     = "https://github.com/kwame-mintah/terraform-azuredevops-git-repositories.git",
      init_type      = "Import",
    },
    {
      name           = "clean-repository"
      default_branch = "refs/head/master"
      source_type    = null
      source_url     = null
      init_type      = "Clean"
  }]
}
```

## Pre-Commit hooks

Git hook scripts are very helpful for identifying simple issues before pushing any changes. Hooks will run on every commit automatically pointing out issues in the code e.g. trailing whitespace.

To help with the maintenance of these hooks, [pre-commit](https://pre-commit.com/) is used, along with [pre-commit-hooks](https://pre-commit.com/#install).

Please following [these instructions](https://pre-commit.com/#install) to install `pre-commit` locally and ensure that you have run `pre-commit install` to install the hooks for this project.

Additionally, once installed, the hooks can be updated to the latest available version with `pre-commit autoupdate`.

## Documentation Generation

Code formatting and documentation for `variables` and `outputs` is generated using [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform/releases) hooks that in turn uses [terraform-docs](https://github.com/terraform-docs/terraform-docs) that will insert/update documentation. The following markers have been added to the `README.md`:

```
<!-- {BEGINNING|END} OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | >= 0.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_git_repository.repo](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/git_repository) | resource |
| [azuredevops_git_repository.repo_attr](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/git_repository) | data source |
| [azuredevops_project.project](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_init_git_repositories"></a> [init\_git\_repositories](#input\_init\_git\_repositories) | (Optional) Names of git repositories to add into the <br>project. | <pre>list(object({<br>    name           = string<br>    default_branch = string<br>    source_type    = string<br>    source_url     = string<br>    init_type      = string<br>  }))</pre> | `[]` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Project. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_git_repos_attributes"></a> [git\_repos\_attributes](#output\_git\_repos\_attributes) | Retrieve the git repository attributes. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
