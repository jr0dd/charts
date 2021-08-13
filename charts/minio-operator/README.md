# minio-operator

![Version: 4.1.8](https://img.shields.io/badge/Version-4.1.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.1.3](https://img.shields.io/badge/AppVersion-v4.1.3-informational?style=flat-square)

A Helm chart for MinIO Operator

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/jr0dd/charts/issues/new/choose)**

## Source Code

* <https://github.com/minio/operator>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add jr0dd https://jr0dd.github.io/charts/
helm repo update
helm install minio-operator jr0dd/minio-operator
```

## Installing the Chart

To install the chart with the release name `minio-operator`

```console
helm install minio-operator jr0dd/minio-operator
```

## Uninstalling the Chart

To uninstall the `minio-operator` deployment

```console
helm uninstall minio-operator
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install minio-operator \
  --set env.TZ="America/New York" \
    jr0dd/minio-operator
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install minio-operator jr0dd/minio-operator -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| console.affinity | object | `{}` |  |
| console.image.pullPolicy | string | `"IfNotPresent"` |  |
| console.image.repository | string | `"minio/console"` |  |
| console.image.tag | string | `"v0.7.5"` |  |
| console.imagePullSecrets | list | `[]` |  |
| console.ingress.annotations | object | `{}` |  |
| console.ingress.enabled | bool | `false` |  |
| console.ingress.host | string | `"console.local"` |  |
| console.ingress.labels | object | `{}` |  |
| console.ingress.path | string | `"/"` |  |
| console.ingress.tls | list | `[]` |  |
| console.initcontainers | list | `[]` |  |
| console.nodeSelector | object | `{}` |  |
| console.replicaCount | int | `1` |  |
| console.resources | object | `{}` |  |
| console.securityContext.runAsNonRoot | bool | `true` |  |
| console.securityContext.runAsUser | int | `1000` |  |
| console.tolerations | list | `[]` |  |
| operator.affinity | object | `{}` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| operator.image.repository | string | `"minio/operator"` |  |
| operator.image.tag | string | `"v4.1.3"` |  |
| operator.imagePullSecrets | list | `[]` |  |
| operator.initcontainers | list | `[]` |  |
| operator.nodeSelector | object | `{}` |  |
| operator.replicaCount | int | `1` |  |
| operator.resources.requests.cpu | string | `"200m"` |  |
| operator.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| operator.resources.requests.memory | string | `"256Mi"` |  |
| operator.securityContext.fsGroup | int | `1000` |  |
| operator.securityContext.runAsGroup | int | `1000` |  |
| operator.securityContext.runAsNonRoot | bool | `true` |  |
| operator.securityContext.runAsUser | int | `1000` |  |
| operator.tolerations | list | `[]` |  |
| tenants[0].certificate.certConfig | object | `{}` |  |
| tenants[0].certificate.externalCaCertSecret | object | `{}` |  |
| tenants[0].certificate.externalCertSecret | object | `{}` |  |
| tenants[0].certificate.requestAutoCert | bool | `true` |  |
| tenants[0].console.affinity | object | `{}` |  |
| tenants[0].console.env | object | `{}` |  |
| tenants[0].console.externalCaCertSecret | object | `{}` |  |
| tenants[0].console.externalCertSecret | object | `{}` |  |
| tenants[0].console.image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants[0].console.image.repository | string | `"minio/console"` |  |
| tenants[0].console.image.tag | string | `"v0.7.5"` |  |
| tenants[0].console.nodeSelector | object | `{}` |  |
| tenants[0].console.replicaCount | int | `1` |  |
| tenants[0].console.resources | object | `{}` |  |
| tenants[0].console.secrets.accessKey | string | `"YOURCONSOLEACCESS"` |  |
| tenants[0].console.secrets.enabled | bool | `true` |  |
| tenants[0].console.secrets.name | string | `"console-secret"` |  |
| tenants[0].console.secrets.passphrase | string | `"SECRET"` |  |
| tenants[0].console.secrets.salt | string | `"SECRET"` |  |
| tenants[0].console.secrets.secretKey | string | `"YOURCONSOLESECRET"` |  |
| tenants[0].console.securityContext | object | `{}` |  |
| tenants[0].console.tolerations | list | `[]` |  |
| tenants[0].env | object | `{}` |  |
| tenants[0].image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants[0].image.repository | string | `"minio/minio"` |  |
| tenants[0].image.tag | string | `"RELEASE.2021-08-05T22-01-19Z"` |  |
| tenants[0].imagePullSecret | object | `{}` |  |
| tenants[0].metrics.enabled | bool | `false` |  |
| tenants[0].metrics.port | int | `9000` |  |
| tenants[0].mountPath | string | `"/export"` |  |
| tenants[0].name | string | `"minio1"` |  |
| tenants[0].namespace | string | `"default"` |  |
| tenants[0].podManagementPolicy | string | `"Parallel"` |  |
| tenants[0].pools[0].affinity | object | `{}` |  |
| tenants[0].pools[0].nodeSelector | object | `{}` |  |
| tenants[0].pools[0].resources | object | `{}` |  |
| tenants[0].pools[0].securityContext | object | `{}` |  |
| tenants[0].pools[0].servers | int | `4` |  |
| tenants[0].pools[0].size | string | `"10Gi"` |  |
| tenants[0].pools[0].storageClassName | string | `"standard"` |  |
| tenants[0].pools[0].tolerations | object | `{}` |  |
| tenants[0].pools[0].volumesPerServer | int | `4` |  |
| tenants[0].priorityClassName | string | `""` |  |
| tenants[0].s3.bucketDNS | bool | `false` |  |
| tenants[0].scheduler | object | `{}` |  |
| tenants[0].secrets.accessKey | string | `"minio"` |  |
| tenants[0].secrets.enabled | bool | `true` |  |
| tenants[0].secrets.name | string | `"minio1-secret"` |  |
| tenants[0].secrets.secretKey | string | `"minio123"` |  |
| tenants[0].serviceMetadata | object | `{}` |  |
| tenants[0].subPath | string | `"/data"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/commonREADME.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[1.0.0]: #1.0.0

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
