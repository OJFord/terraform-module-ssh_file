locals {
  jumps    = join(" ", [for conn in var.jumps : "-J ${conn.user}@${conn.host}"])
  target   = "${var.connection.user}@${var.connection.host}"
  filename = var.filename
}


data "external" "cat" {
  program = [
    "sh",
    "-c",
    "jq -n --arg content \"$(ssh ${local.jumps} ${local.target} cat ${local.filename})\" '{$content}'",
  ]
}
