output "content" {
  value = data.external.cat.result.content
}

output "content_md5" {
  value = md5(data.external.cat.result.content)
}
