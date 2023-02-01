variable "TAG" {
  default = ""
}

variable "IS_LATEST" {
  default = true
}

variable "PYTHON_VERSION" {
  default = "3.11"
}

group "default" {
  targets = ["alpine", "slim", "python"]
}

target "alpine" {
  dockerfile = "python${PYTHON_VERSION}-alpine.dockerfile"
  tags = [
    notequal("",TAG) ? "mhadam/hypercorn:${PYTHON_VERSION}-alpine-${TAG}": "mhadam/hypercorn:${PYTHON_VERSION}-alpine",
  ]
}

target "slim" {
  dockerfile = "python${PYTHON_VERSION}-slim.dockerfile"
  tags = [
    notequal("",TAG) ? "mhadam/hypercorn:${PYTHON_VERSION}-slim-${TAG}": "mhadam/hypercorn:${PYTHON_VERSION}-slim",
    IS_LATEST ? "mhadam/hypercorn:latest": "",
  ]
}

target "python" {
  dockerfile = "python${PYTHON_VERSION}.dockerfile"
  tags = [
    notequal("",TAG) ? "mhadam/hypercorn:${PYTHON_VERSION}-python-${TAG}": "mhadam/hypercorn:${PYTHON_VERSION}-python",
  ]
}