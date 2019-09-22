variable "connection" {
  description = "SSH credentials for connecting to the remote server"
  type = object({
    host = string
    user = string
  })
}

variable "filename" {
  description = "Path to the file on the remote server"
  type        = string
}

variable "jumps" {
  description = "Optional list of SSH credentials for jump boxes needed to connect to the remote server"
  type = list(object({
    host = string
    user = string
  }))
  default = []
}
