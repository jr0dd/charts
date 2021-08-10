# discord-stock-ticker

![Version: 11.0.0](https://img.shields.io/badge/Version-11.0.0-informational?style=flat-square) ![AppVersion: 3.3.0](https://img.shields.io/badge/AppVersion-3.3.0-informational?style=flat-square)

discord stock ticker bot

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/jr0dd/charts/issues/new/choose)**

## Source Code

* <https://github.com/rssnyder/discord-stock-ticker>
* <https://github.com/jr0dd/charts>
* <https://github.com/jr0dd/container-images>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

## TL;DR

```console
helm repo add jr0dd https://jr0dd.github.io/charts/
helm repo update
helm install discord-stock-ticker jr0dd/discord-stock-ticker
```

## Installing the Chart

To install the chart with the release name `discord-stock-ticker`

```console
helm install discord-stock-ticker jr0dd/discord-stock-ticker
```

## Uninstalling the Chart

To uninstall the `discord-stock-ticker` deployment

```console
helm uninstall discord-stock-ticker
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install discord-stock-ticker \
  --set env.TZ="America/New York" \
    jr0dd/discord-stock-ticker
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install discord-stock-ticker jr0dd/discord-stock-ticker -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configmap.config | string | `"#!/usr/bin/env bash\nset -eu\n\nFREQ=\"10\"\nNICK=\"true\"\nCOLOR=\"true\"\nACTIVITY=\"\"\n\ncurl -X POST \\\n\"localhost:8080/ticker\" \\\n-H \"Content-Type: application/json\" \\\n-d \"{\\\"ticker\\\":\\\"BTC\\\", \\\n  \\\"name\\\":\\\"bitcoin\\\", \\\n  \\\"discord_bot_token\\\":\\\"${BTC}\\\", \\\n  \\\"crypto\\\":true, \\\n  \\\"frequency\\\":${FREQ}, \\\n  \\\"set_nickname\\\":${NICK}, \\\n  \\\"set_color\\\":${COLOR}, \\\n  \\\"bitcoin\\\":false, \\\n  \\\"activity\\\":\\\"${ACTIVITY}\\\"}\"\n\ncurl -X POST \\\n\"localhost:8080/ticker\" \\\n-H \"Content-Type: application/json\" \\\n-d \"{\\\"ticker\\\":\\\"GME\\\", \\\n  \\\"name\\\":\\\"GME\\\", \\\n  \\\"discord_bot_token\\\":\\\"${GME}\\\", \\\n  \\\"frequency\\\":${FREQ}, \\\n  \\\"set_nickname\\\":${NICK}, \\\n  \\\"set_color\\\":${COLOR}, \\\n  \\\"activity\\\":\\\"${ACTIVITY}\\\"}\"\n"` |  |
| configmap.enabled | bool | `false` |  |
| controller.enabled | bool | `true` |  |
| controller.replicas | int | `1` |  |
| controller.strategy | string | `"RollingUpdate"` |  |
| env.TZ | string | `"America/New_York"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/jr0dd/discord-stock-ticker"` |  |
| image.tag | string | `"v3.3.0"` |  |
| lifecycle.postStart.exec.command[0] | string | `"bash"` |  |
| lifecycle.postStart.exec.command[1] | string | `"/app/config.sh"` |  |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.exec.command[0] | string | `"bash"` |  |
| probes.liveness.spec.exec.command[1] | string | `"-c"` |  |
| probes.liveness.spec.exec.command[2] | string | `"if [[ $(curl -s https://discord.com) ]]; then exit 0; else exit $?; fi"` |  |
| probes.liveness.spec.failureThreshold | int | `5` |  |
| probes.liveness.spec.initialDelaySeconds | int | `0` |  |
| probes.liveness.spec.periodSeconds | int | `5` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| prometheus.prometheusRule.additionalLabels | object | `{}` |  |
| prometheus.prometheusRule.enabled | bool | `false` |  |
| prometheus.serviceMonitor.additionalLabels | object | `{}` |  |
| prometheus.serviceMonitor.enabled | bool | `false` |  |
| prometheus.serviceMonitor.interval | string | `"10s"` |  |
| service.main.ports.http.port | int | `8080` |  |

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
