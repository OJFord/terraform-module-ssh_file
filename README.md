It's easy to access the contents of a file on the machine running terraform with `data "local_file"` but in order to access a file on a *remote* machine (outside of a `provisioner`) [we have to resort to `data "external"` to run a custom command](https://github.com/hashicorp/terraform/issues/22738#).

This `ssh_file` module is designed to address this by abstracting it into a more convenient to use `module`.
