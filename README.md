# `ssh_file` - a terraform module

```hcl
data "local_file" "myfile" {
  filename = "/etc/foobar"
}
```
is a convenient way of accessing the contents of a file on the machine running terraform, but in order to access a file on a *remote* machine (outside of a `provisioner`) [we have to resort to `data "external"` to run a custom command](https://github.com/hashicorp/terraform/issues/22738#).

This `ssh_file` module is designed to address this by abstracting it into a more convenient to use `module`.

## Usage

```hcl
module "foobar" {
  source = "OJFord/ssh_file/module"

  connection = {
    host = server.example.com
    user = root
  }
  filename = "/etc/foobar"
}
```

And then we can use the outputs `content` and `content_md5` in some other resource:
```hcl
resource "local_file" "foobar" {
  content = module.foobar.content
  filename = "~/foobar-backups/${modulee.foobar.content_md5}"
}
```
### Jump boxes

If you need to connect via on or more jump boxes, you can supply a list of connection objects with the `jumps` variable.
