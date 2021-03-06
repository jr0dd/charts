# discord-stock-ticker

![Version: 13.5.0](https://img.shields.io/badge/Version-13.5.0-informational?style=flat-square) ![AppVersion: 3.7.1](https://img.shields.io/badge/AppVersion-3.7.1-informational?style=flat-square)

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
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

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
| configmap | object | `{"config":{"data":"#!/usr/bin/env bash\nset -eu\n\nFREQ=\"10\"\nNICK=\"true\"\nCOLOR=\"true\"\nACTIVITY=\"\"\n\ncurl -X POST \\\n\"localhost:8080/ticker\" \\\n-H \"Content-Type: application/json\" \\\n-d \"{\\\"ticker\\\":\\\"BTC\\\", \\\n  \\\"name\\\":\\\"bitcoin\\\", \\\n  \\\"discord_bot_token\\\":\\\"${BTC}\\\", \\\n  \\\"crypto\\\":true, \\\n  \\\"frequency\\\":${FREQ}, \\\n  \\\"set_nickname\\\":${NICK}, \\\n  \\\"set_color\\\":${COLOR}, \\\n  \\\"bitcoin\\\":false, \\\n  \\\"activity\\\":\\\"${ACTIVITY}\\\"}\"\n\ncurl -X POST \\\n\"localhost:8080/ticker\" \\\n-H \"Content-Type: application/json\" \\\n-d \"{\\\"ticker\\\":\\\"GME\\\", \\\n  \\\"name\\\":\\\"GME\\\", \\\n  \\\"discord_bot_token\\\":\\\"${GME}\\\", \\\n  \\\"frequency\\\":${FREQ}, \\\n  \\\"set_nickname\\\":${NICK}, \\\n  \\\"set_color\\\":${COLOR}, \\\n  \\\"activity\\\":\\\"${ACTIVITY}\\\"}\"\n","enabled":false}}` | Configure configMaps for the chart here.  Additional configMaps can be added by adding a dictionary key similar to the 'config' object.  @default -- See below |
| configmap.config.enabled | bool | `false` | Enables or disables the configMap |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/jr0dd/discord-stock-ticker"` | image repository |
| image.tag | string | `"v3.6.1"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| lifecycle.postStart | object | See values.yaml | Set the container lifecycle event |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"30s"` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/commonREADME.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [13.0.0]

#### Changed

- **BREAKING**: Refactored Prometheus metrics. Enabling metrics automatically enables the serviceMonitor.

### [12.2.0]

#### Added

- Update image with support for using Twelve Data API

### [12.0.0]

#### Changed

- Many changes in the chart regarding configmaps, persistence and delivery of the payload

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[13.0.0]: #1300
[12.2.0]: #1220
[12.0.0]: #1200
[1.0.0]: #100

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
