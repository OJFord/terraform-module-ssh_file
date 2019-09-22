variable "connection" {
  type = object({
    host = string
    user = string
  })
}

variable "filename" {
  type = string
}

variable "jumps" {
  type = list(object({
    host = string
    user = string
  }))
  default = []
}
