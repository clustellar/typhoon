# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/poseidon/terraform-render-bootkube.git?ref=b6b320ef6aceb7b72802b3aea6da6690d6a7c509"

  cluster_name                  = "${var.cluster_name}"
  api_servers                   = ["${format("%s.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers                  = ["http://127.0.0.1:2379"]
  asset_dir                     = "${var.asset_dir}"
  networking                    = "${var.networking}"
  network_mtu                   = "${var.network_mtu}"
  pod_cidr                      = "${var.pod_cidr}"
  service_cidr                  = "${var.service_cidr}"
  experimental_self_hosted_etcd = "true"
}
