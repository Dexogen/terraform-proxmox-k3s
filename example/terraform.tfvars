cluster_name         = "dex-k3s"

insecure_registries = [ "hub.dexogen.ru" ]

default_node_settings = {
  nameserver   = "192.168.2.1"
  searchdomain = "k8s.dexogen.ru"
  target_node  = "dex-srv-1"
  target_pool  = "K3S"
  image_id     = "ubuntu-22.04"
  disk_size    = "30G"
  memory       = 4096
  storage_id   = "ssd-raid"
  subnet       = "192.168.2.0/23"
  gw           = "192.168.2.1"
  ciuser       = "terraform"
  network_bridge = "vmbr2"
  authorized_keys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwDau78dL7wMmxVePHR9FsH9GyLO88lViIW4fEpEsutsUYLyaYbyrxnf2jUJ6FxInpe/VrnW23XViZAf3QEDfaPjJlcsNzdZ4najsBULvxjYnPASPp3EhKWbRYP4Gx/y6JV/LE8KmhG60YU7RxbDIEWKykVzj9sQYPAo3r6BfS6gRVd8NXRh2ww00JDfTDdjWTn1cAwMR4ccj+O2Nw539kr8+DWfi5MIm3nwyIIMnM3Of8Aq4FhP2BTLsl/16CTQMBWybHyAj27kcUEGifQHhxzggpA1/hU6haC91sEAGr6cGRSgwSf/o8PzcJ/E89XVUr7GMFfMoj9UcA4cAvCY3T
    EOF
}

support_node_settings = {
  ip_offset = 150,
  memory = 2048
}

master_node_settings = {
  count     = 1
  ip_offset = 151
  memory    = 2048
}

node_pools = [
  {
    name      = "worker"
    cores     = 2
    size      = 2
    disk_size = "10G"
    ip_offset = 153
    memory    = 2048
  }
]
