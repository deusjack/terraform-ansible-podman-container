variable "external_triggers" {
  type        = map(string)
  description = "Triggers for rerunning the directory playbook except variables"
  default     = {}
}

# Doesn't need a trigger. On change the playbooks is automatically replaced.
variable "hostname" {
  type        = string
  description = "The hostname of linux machine the directory will be created on"
}

variable "name" {
  type        = string
  description = "Name of the container"
}

variable "image" {
  type        = string
  description = "Image to run as container"
}

variable "ports" {
  type        = list(string)
  description = "List of port mapping strings, e.g.: \"8080:8080\""
  default     = []
}

variable "cap_add" {
  type        = list(string)
  description = "System capabilities to add"
  default     = []
}

variable "cap_drop" {
  type        = list(string)
  description = "System capabilities to drop"
  default     = []
}

variable "privileged" {
  type        = bool
  description = "If the container has privileged permissions"
  default     = false
}

variable "user" {
  type        = string
  description = "The user the container is run with"
  default     = null
}

variable "command" {
  type        = string
  description = "The command you want to overwrite the default with"
  default     = null
}

variable "volumes" {
  type        = list(string)
  description = "List of volume strings, e.g. \"/etc/service:/etc/service\""
  default     = []
}

variable "environment_variables" {
  type        = map(string)
  description = "Map of environment variables to pass to the container"
  default     = {}
}

variable "network" {
  type        = string
  description = "The network namespace the container will use"
  default     = "host"
}

variable "conmon_pidfile" {
  type        = string
  description = "The path to a file, in which conmon stores the containers PID"
  default     = null
}

variable "labels" {
  type        = map(string)
  description = "Labels added to the container"
  #default = {"io.containers.autoupdate" = "registry"}
  default = {}
}
