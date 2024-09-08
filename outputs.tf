output "triggers" {
  value = {
    playbook = ansible_playbook.container.id
  }
}

output "name" {
  description = "Name of the container"
  value       = ansible_playbook.container.extra_vars.container_name
}

output "image" {
  description = "Image to run as container"
  value       = ansible_playbook.container.extra_vars.image
}

output "ports" {
  description = "List of port mapping strings, e.g.: \"8080:8080\""
  value       = var.ports
}

output "cap_add" {
  description = "System capabilities to add"
  value       = var.cap_add
}

output "cap_drop" {
  description = "System capabilities to drop"
  value       = var.cap_drop
}

output "privileged" {
  description = "If the container has privileged permissions"
  value       = var.privileged
}

output "user" {
  description = "The user the container is run with"
  value       = var.user != null ? var.user : "root"
}

output "command" {
  description = "The command you want to overwrite the default with"
  value       = var.command
}

output "volumes" {
  description = "List of volume strings, e.g. \"/etc/service:/etc/service\""
  value       = var.volumes
}

output "environment_variables" {
  description = "Map of environment variables to pass to the container"
  value       = var.environment_variables
}

output "network" {
  description = "The network namespace the container will use"
  value       = var.network
}

output "conmon_pidfile" {
  description = "The path to a file, in which conmon stores the containers PID"
  value       = var.conmon_pidfile
}

output "labels" {
  description = "Labels added to the container"
  value       = var.labels
}
