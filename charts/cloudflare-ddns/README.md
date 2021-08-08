# cloudflare-ddns

![Version: 5.3.4](https://img.shields.io/badge/Version-5.3.4-informational?style=flat-square) ![AppVersion: 3.1.0](https://img.shields.io/badge/AppVersion-3.1.0-informational?style=flat-square)

cloudflare ddns updater

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/jr0dd/charts/issues/new/choose)**

## Source Code

* <https://github.com/jr0dd/container-images>
* <https://github.com/jr0dd/charts>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 3.3.0 |

## TL;DR

```console
helm repo add jr0dd https://jr0dd.github.io/charts/
helm repo update
helm install cloudflare-ddns jr0dd/cloudflare-ddns
```

## Installing the Chart

To install the chart with the release name `cloudflare-ddns`

```console
helm install cloudflare-ddns jr0dd/cloudflare-ddns
```

## Uninstalling the Chart

To uninstall the `cloudflare-ddns` deployment

```console
helm uninstall cloudflare-ddns
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install cloudflare-ddns \
  --set env.TZ="America/New York" \
    jr0dd/cloudflare-ddns
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install cloudflare-ddns jr0dd/cloudflare-ddns -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.enabled | bool | `true` |  |
| controller.replicas | int | `1` |  |
| controller.strategy | string | `"RollingUpdate"` |  |
| env.CRON | string | `"*/15 * * * *"` |  |
| env.TZ | string | `"America/New_York"` |  |
| envFrom[0].secretRef.name | string | `"cloudflare-api-credentials"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/jr0dd/cloudflare-ddns"` |  |
| image.tag | string | `"v3.1.0"` |  |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.mountPath | string | `"/config"` |  |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.exec.command[0] | string | `"bash"` |  |
| probes.liveness.spec.exec.command[1] | string | `"-c"` |  |
| probes.liveness.spec.exec.command[2] | string | `"if [[ $(pidof cron) ]]; then exit 0; fi"` |  |
| probes.liveness.spec.failureThreshold | int | `5` |  |
| probes.liveness.spec.initialDelaySeconds | int | `0` |  |
| probes.liveness.spec.periodSeconds | int | `5` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.exec.command[0] | string | `"bash"` |  |
| probes.readiness.spec.exec.command[1] | string | `"-c"` |  |
| probes.readiness.spec.exec.command[2] | string | `"if crontab -l | grep -q 'ddns'; then exit 0; fi"` |  |
| probes.readiness.spec.failureThreshold | int | `3` |  |
| probes.readiness.spec.initialDelaySeconds | int | `0` |  |
| probes.readiness.spec.periodSeconds | int | `5` |  |
| probes.readiness.spec.timeoutSeconds | int | `1` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.exec.command[0] | string | `"bash"` |  |
| probes.startup.spec.exec.command[1] | string | `"-c"` |  |
| probes.startup.spec.exec.command[2] | string | `"if crontab -l | grep -q 'API'; then exit 0; fi"` |  |
| probes.startup.spec.failureThreshold | int | `3` |  |
| probes.startup.spec.initialDelaySeconds | int | `5` |  |
| probes.startup.spec.periodSeconds | int | `10` |  |
| probes.startup.spec.timeoutSeconds | int | `2` |  |
| service.main.enabled | bool | `false` |  |

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
