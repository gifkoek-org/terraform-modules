# Github Repository

Provisions a Github Repository

## Parameters

| Variable               | Type           | Description                                                                                          | Required | Default |
| ---------------------- | -------------- | ---------------------------------------------------------------------------------------------------- | -------- | ------- |
| name                   | `string`       | Name for the repository                                                                              | yes      |         |
| description            | `string`       | Description for the repository                                                                       | yes      |         |
| review_count           | `number`       | Number of required reviewers for a PR                                                                | yes      |         |
| writer_teams           | `list(string)` | Teams that can write to the repository                                                               | yes      |         |
| owner_teams            | `list(string)` | Teams that own the repository / can write to the master branch                                       | yes      |         |
| auto_init              | `bool`         | Auto-init. Should be explicitly set to false for repositories that haven't been created by Terraform | no       | `true`  |
| archived               | `bool`         | Defines if repository is archived                                                                    | no       | `false` |
| allow_merge_commit     | `bool`         | Allow merge commit                                                                                   | no       | `true`  |
| allow_squash_merge     | `bool`         | Allow squash merge commit                                                                            | no       | `true`  |
| allow_rebase_merge     | `bool`         | Allow rebase merge commit                                                                            | no       | `true`  |
| constellation          | `string`       | Constellation that owns the repository                                                               | no       | `""`    |
| delete_branch_on_merge | `bool`         |Automatically delete head branch after a pull request is merged                                       | no       | `false  |
| required_status_checks | `list(string)` | List of required status checks                                                                       | no       | `[]`    |
| strict                 | `bool`         | Require branches to be up to date before merging                                                     | no       | `false` |

## Outputs

| Variable            | Description                  |
| ------------------- | ---------------------------- |
| repository_ssh_url  | Repository's SSH clone URL   |
| repository_http_url | Repository's HTTPS clone URL |

## Example

```hcl
module "github-iac-test" {
  source       = "git@github.com:gifkoek-org/terraform-modules.git//modules/github-repo"
  name         = "github-iac"
  description  = "GitHub Infrastructure as code"
  writer_teams = ["ownerteam"]
  owner_teams  = ["readers"]
}
```
