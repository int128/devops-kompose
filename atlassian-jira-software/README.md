# Atlassian JIRA Software

This chart bootstraps an Atlassian JIRA Software server using the [cptactionhank/atlassian-jira-software](https://github.com/cptactionhank/docker-atlassian-jira-software) image.


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`reverseProxyHost` | Hostname of the server. | `jira.example.com`
`reverseProxyPort` | Port of the server. | `443`
`reverseProxyScheme` | `http` or `https`. | `https`
`javaOptions` | JavaVM options. | See values.yaml
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[]`
`resources` | Pod resource requests and limits. | See values.yaml
`nodeSelector` | Node labels for pod assignment | `{}`
