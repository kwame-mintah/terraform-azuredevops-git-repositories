# Simple Example

An example on how to use the module in your Azure DevOps project.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | >= 0.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | >= 0.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_git_repositories"></a> [git\_repositories](#module\_git\_repositories) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [azuredevops_project.project](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_git_repositories_repo_attr"></a> [git\_repositories\_repo\_attr](#output\_git\_repositories\_repo\_attr) | Name for all git repositories within the project. |
<!-- END_TF_DOCS -->
