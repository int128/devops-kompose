# Mattermost

This is a yet another Mattermost Helm chart.

This chart bootstraps a deployment with the [mattermost/mattermost-prod-app](https://hub.docker.com/r/mattermost/mattermost-prod-app/) image image on a Kubernetes cluster.


## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure


## Getting Started

To install the chart with the release name `mattermost`:

```sh
helm install ./mattermost --name mattermost
```

To delete the release `mattermost`:

```sh
helm delete mattermost
```


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`mattermost.dbHost` | Database hostname. | ``
`mattermost.dbPort` | Database port. | ``
`mattermost.dbName` | Database name. | `mattermost`
`mattermost.dbUsername` | Database username. | `mattermost`
`mattermost.dbPassword` | Database password. | `mattermost`
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[mattermost.example.com]`
`resources.limits` | Pod resource limits. | `{}`
`resources.requests` | Pod resource requests. | `{}`
`nodeSelector` | Node labels for pod assignment | `{}`


### Resources Limits

TODO


### Persistence

This chart creates a `PersistentVolumeClaim` with 8GB volume by default.
You can set size as follows:

```yaml
# values.yaml
persistence:
  size: 100Gi
```


## Upgrade Mattermost

To upgrade to a more recent version of Mattermost:

```sh
helm upgrade mattermost
```
