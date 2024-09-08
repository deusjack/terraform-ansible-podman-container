resource "ansible_playbook" "container" {
  name                    = var.hostname
  playbook                = "${path.module}/podman.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = merge(
    {
      container_name = "systemd-${var.name}"
      image          = var.image
      ports          = jsonencode(var.ports)
      cap_add        = jsonencode(var.cap_add)
      cap_drop       = jsonencode(var.cap_drop)
      privileged     = var.privileged
      volumes        = jsonencode(var.volumes)
      network        = var.network
    },
    var.user != null ? { namespace_user = var.user } : {},
    var.command != null ? { command = var.command } : {},
    length(var.environment_variables) > 0 ? { env = jsonencode(var.environment_variables) } : {},
    var.conmon_pidfile != null ? { conmon_pidfile = var.conmon_pidfile } : { conmon_pidfile = "/run/containers/systemd-${var.name}.pid" },
    length(var.labels) > 0 ? { labels = jsonencode(var.labels) } : {}
  )
  lifecycle {
    replace_triggered_by = [
      null_resource.podman,
      null_resource.external,
      null_resource.variables
    ]
  }
}

module "systemd" {
  depends_on = [ansible_playbook.container]
  source     = "git@github.com:deusjack/module-systemd.git?ref=1.0.0"
  hostname   = var.hostname
  unit_name  = "container-systemd-${var.name}"
}
