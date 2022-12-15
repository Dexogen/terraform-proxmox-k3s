# cluster name!
cluster_name         = "bart"

# if you want to add any "insecure" registries to the nodes, add them here
insecure_registries = [ "registry.k8s.lab" ]

# default node settings are inherited to all node types, you only need to override the settings you want to change
default_node_settings = {
  nameserver   = "10.10.0.1"
  searchdomain = "k8s.lab"
  target_node  = "pve"
  target_pool  = "k8s"
  image_id     = "template-cloudinit-ubuntu2204"
  disk_size    = "30G"
  memory       = 4096
  storage_id   = "vms-01"
  subnet       = "10.10.0.0/16"
  gw           = "10.10.0.1"
  ciuser       = "terraform"
  network_bridge = "vmbr0"
  # put your authorized_keys content below this line, before the end-of-file marker
  authorized_keys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAQKzUKoLlnmONhr0X5Nd99r6M96VbKysVVrgKVlaADVWSTNJxoaZY4U1BIHXvXpWrTWQLzuKz1JOkroMI1xZCbjR2fv7wWbRqcALadINCRs5fE8oTA/ZQsar82NUzMGHxNtlrhaRhiHf4JLzAdBQoPQaIHPYROpqT2ygABoDhBtP7HzsAA5ul9hVkGz2eM/j5NguvgTMzU/mGwlnLXGDaihGmY0eQLvxpergvDeczxjb2yYBMVm9execfT8Y8TxitivQzZZxwM/hlF/y9ggfBb3XRMbdOog/fwQlLmCn0ffMXZapAIieLKgF6LLljvZz8c+8Wl2ybZcWnOMUN/r/1bn0coLVe6exUK9ygMyqKl2tFqY3ITuuV3Pkk0cBtzvypGYPhdiPdf5701zZMgyDtO3hzk5cjJXx10CfuvwTsPLkLqCzu7HJjW2s+1FL3stk7VYw4e9MGr+Z46mBH+lWGn4RNQmDvhR3ChdVNb1HgslM5dN9VWqtfyO4XVI+LRf0= root@admin
    EOF
}

# support node
support_node_settings = {
  ip_offset = 10 * 256 + 1,
  memory = 2048
}

# 2 master nodes
master_node_settings = {
  count     = 2
  ip_offset = 10 * 256 + 2
  memory    = 2048
}

# 2 node pools
node_pools = [
  {
    name      = "small"
    cores     = 2
    size      = 25
    disk_size = "10G"
    ip_offset = 10 * 256 + 10
    memory    = 2048
    node_labels = [ "tietze.io/instance-type=small" ]
  },
  {
    name      = "large"
    cores     = 4
    size      = 2
    disk_size = "30G"
    ip_offset = 10 * 256 + 100
    memory    = 10000
    node_labels = [ "tietze.io/instance-type=large" ]
  }
]