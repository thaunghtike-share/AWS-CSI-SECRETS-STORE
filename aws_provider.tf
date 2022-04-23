locals {
  kubeconfig = templatefile("${path.module}/kubeconfig.tpl", {
    endpoint            = data.aws_eks_cluster.cluster.endpoint
    cluster_auth_base64 = data.aws_eks_cluster.cluster.certificate_authority.0.data
    user_token          = data.aws_eks_cluster_auth.cluster.token
  })
}

// This null_resource will execute 'helm test' each time helm_release.csii_secrets_store is created/updated

resource "null_resource" "helm_test_csi_secrets_store" {
  triggers = {
    name       = helm_release.csi-secrets-store.name
    namespace  = helm_release.csi-secrets-store.namespace
    repository = helm_release.csi-secrets-store.repository
  }

  depends_on = [helm_release.csi-secrets-store]

  provisioner "local-exec" {
    environment = {
      // Placing these values in the environment to prevent them from being logged
      KUBECONFIG = local.kubeconfig
    }
    command = <<EOF
echo "$KUBECONFIG" > ./kubeconfig
chmod 400 ./kubeconfig
export KUBECONFIG=./kubeconfig
kubectl apply -f "https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml"
EOF
  }
}