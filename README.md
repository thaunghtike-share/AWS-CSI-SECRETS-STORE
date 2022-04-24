# AWS Secrets Manager and Config Provider for Secret Store CSI Driver

AWS offers two services to manage secrets and parameters conveniently in your code. AWS Secrets Manager allows you to easily rotate, manage, and retrieve database credentials, API keys, certificates, and other secrets throughout their lifecycle. AWS Systems Manager Parameter Store provides hierarchical storage for configuration data. The AWS provider for the Secrets Store CSI Driver allows you to make secrets stored in Secrets Manager and parameters stored in Parameter Store appear as files mounted in Kubernetes pods.

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~>4.0.0 |
| helm | 2.5.1 |
| null | ~>3.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~>4.0.0 |
| helm | 2.5.1 |
| null | ~>3.0.0 |

## Deployment

```sh
terraform init
terraform plan
terraform apply -auto-approve
```

## Tier down

```sh
terraform destroy -auto-approve
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | the name of AWS region | `string` | n/a | yes |
| eks\_cluster\_name | the name of EKS cluster to deploy this helm chart | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| chart | the name of the chart |
| name | the name of the release |
| namespace | the kubernetes namespace of the release |

## Examples

```bash
module "aws-csi-secrets-store" {
  source = "../../"

  eks_cluster_name = "eksdemo1"
  aws_region       = "us-east-1"
}

resource "null_resource" "delete-aws-provider" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOF
export KUBECONFIG=./kubeconfig
kubectl delete -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
rm -rf ./kubeconfig
EOF
  }
  depends_on = [
    module.aws-csi-secrets-store
  ]
}
```
