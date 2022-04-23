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

