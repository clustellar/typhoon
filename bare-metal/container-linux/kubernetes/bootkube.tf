# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/poseidon/terraform-render-bootkube.git?ref=b6b320ef6aceb7b72802b3aea6da6690d6a7c509"

  cluster_name = "${var.cluster_name}"
  api_servers  = ["${var.k8s_domain_name}"]
  etcd_servers = ["${var.controller_domains}"]
  asset_dir    = "${var.asset_dir}"
  networking   = "${var.networking}"
  network_mtu  = "${var.network_mtu}"
  pod_cidr     = "${var.pod_cidr}"
  service_cidr = "${var.service_cidr}"
}
