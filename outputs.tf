output "content" {
  description = "Contents of the file on the remote server"
  value       = data.external.cat.result.content
}

output "content_md5" {
  description = "MD5 sum of the file contents"
  value       = md5(data.external.cat.result.content)
}
