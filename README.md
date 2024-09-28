# terraform-ansible-podman-container
Terraform module to create a Podman container on Linux with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.
> * Set the image version to be exact or minor, because auto update is enabled.

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_systemd"></a> [systemd](#module\_systemd) | git@github.com:deusjack/terraform-ansible-systemd.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.container](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [null_resource.external](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.podman](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.variables](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cap_add"></a> [cap\_add](#input\_cap\_add) | System capabilities to add | `list(string)` | `[]` | no |
| <a name="input_cap_drop"></a> [cap\_drop](#input\_cap\_drop) | System capabilities to drop | `list(string)` | `[]` | no |
| <a name="input_command"></a> [command](#input\_command) | The command you want to overwrite the default with | `string` | `null` | no |
| <a name="input_conmon_pidfile"></a> [conmon\_pidfile](#input\_conmon\_pidfile) | The path to a file, in which conmon stores the containers PID | `string` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Map of environment variables to pass to the container | `map(string)` | `{}` | no |
| <a name="input_external_triggers"></a> [external\_triggers](#input\_external\_triggers) | Triggers for rerunning the directory playbook except variables | `map(string)` | `{}` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of linux machine the directory will be created on | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Image to run as container | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels added to the container | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the container | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The network namespace the container will use | `string` | `"host"` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | List of port mapping strings, e.g.: "8080:8080" | `list(string)` | `[]` | no |
| <a name="input_privileged"></a> [privileged](#input\_privileged) | If the container has privileged permissions | `bool` | `false` | no |
| <a name="input_user"></a> [user](#input\_user) | The user the container is run with | `string` | `null` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | List of volume strings, e.g. "/etc/service:/etc/service" | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cap_add"></a> [cap\_add](#output\_cap\_add) | System capabilities to add |
| <a name="output_cap_drop"></a> [cap\_drop](#output\_cap\_drop) | System capabilities to drop |
| <a name="output_command"></a> [command](#output\_command) | The command you want to overwrite the default with |
| <a name="output_conmon_pidfile"></a> [conmon\_pidfile](#output\_conmon\_pidfile) | The path to a file, in which conmon stores the containers PID |
| <a name="output_environment_variables"></a> [environment\_variables](#output\_environment\_variables) | Map of environment variables to pass to the container |
| <a name="output_image"></a> [image](#output\_image) | Image to run as container |
| <a name="output_labels"></a> [labels](#output\_labels) | Labels added to the container |
| <a name="output_name"></a> [name](#output\_name) | Name of the container |
| <a name="output_network"></a> [network](#output\_network) | The network namespace the container will use |
| <a name="output_ports"></a> [ports](#output\_ports) | List of port mapping strings, e.g.: "8080:8080" |
| <a name="output_privileged"></a> [privileged](#output\_privileged) | If the container has privileged permissions |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | n/a |
| <a name="output_user"></a> [user](#output\_user) | The user the container is run with |
| <a name="output_volumes"></a> [volumes](#output\_volumes) | List of volume strings, e.g. "/etc/service:/etc/service" |
<!-- END_TF_DOCS -->
