module "remote_etc_hosts" {
  source = "OJFord/ssh_file/module"

  connection = {
    host = server.example.com
    user = root
  }
  filename = "/etc/hosts"
}

resource "local_file" "foobar" {
  content  = module.remote_etc_hosts.content
  filename = "/tmp/hosts-backups/${module.remote_etc_hosts.content_md5}"
}
