# JIRA to Mattermost Integration

A Helm chart for https://github.com/int128/jira-to-slack.


## Prerequisites

- Kubernetes 1.9+ with Beta APIs enabled


## Getting Started

To install the chart with the release name `jira-to-slack`:

```sh
helm install ./jira-to-slack --name jira-to-slack
```

To upgrade to a more recent version of jira-to-slack:

```sh
helm upgrade jira-to-slack
```

To delete the release `jira-to-slack`:

```sh
helm delete jira-to-slack
```


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[jira-to-slack.example.com]`
`resources.limits` | Pod resource limits. | `{}`
`resources.requests` | Pod resource requests. | `{}`
`nodeSelector` | Node labels for pod assignment | `{}`
