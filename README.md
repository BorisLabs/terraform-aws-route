# terraform-aws-route
Terraform Module to create multiple routes to one Route table

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| route\_table\_id | Route table ID to search for | `string` | `null` | no |
| route\_table\_lookup\_tags | Map of tags to lookup Route Table | `map(string)` | `{}` | no |
| routes | List of routes to be added to route table | `list(string)` | `[]` | no |
| transit\_gateway\_id | ID of Transit Gateway to associate route to | `string` | `""` | no |

## Outputs

No output.
