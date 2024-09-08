#################
# ansible files #
#################

resource "null_resource" "podman" {
  triggers = {
    podman = filemd5("${path.module}/podman.yaml")
  }
}

#####################
# external triggers #
#####################

resource "null_resource" "external" {
  triggers = var.external_triggers
}

#############
# variables #
#############

resource "null_resource" "variables" {
  triggers = {
    container_name = var.name
    image          = var.image
    ports          = jsonencode(var.ports)
    cap_add        = jsonencode(var.cap_add)
    cap_drop       = jsonencode(var.cap_drop)
    privileged     = var.privileged
    volumes        = jsonencode(var.volumes)
    network        = var.network
    namespace_user = var.user
    command        = var.command
    env            = jsonencode(var.environment_variables)
    conmon_pidfile = var.conmon_pidfile
    labels         = jsonencode(var.labels)
  }
}
