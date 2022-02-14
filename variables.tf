variable "instances" {

  default = {
    "zookeeper" = {
      name          = "zookeeper-instance"
      instance_type = "f1.micro"
      disk_size ="10"

    },
    "kafka1" = {
      name          = "kafka1"
      instance_type = "g1-small"
      disk_size ="20"
    }
    "kafka2" = {
      name          = "kafka2"
      instance_type = "g1-small"
      disk_size ="20"
    }
    "kafka3" = {
      name          = "kafka3"
      instance_type = "g1-small"
      disk_size ="20"
    }

  }
}
variable "ssh_user" {
  default = "demogcp"

}

variable "pub_key_file" {
  default = "./demogcp.pub"
}