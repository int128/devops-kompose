# Atlassian JIRA Software

This chart bootstraps an Atlassian JIRA Software server using the [cptactionhank/atlassian-jira-software](https://github.com/cptactionhank/docker-atlassian-jira-software) image.


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`reverseProxyHost` | Hostname of the server. | `jira.example.com`
`reverseProxyPort` | Port of the server. | `443`
`reverseProxyScheme` | `http` or `https`. | `https`
`javaMemorySize` | JavaVM memory size passed as `-Xmx` and `-Xms`. | `1024M`
`javaOptions` | JavaVM options. | 
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[]`
`resources.limits` | Pod resource limits. | `cpu: 800m, memory: 1536Mi`
`resources.requests` | Pod resource requests. | `cpu: 0, memory: 1536Mi`
`nodeSelector` | Node labels for pod assignment | `{}`


## Known issues

### Memory limits

JIRA server requires `-Xmx` and `-Xms` options and does not work with `-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap` option for now (see [JRASERVER-67303](https://jira.atlassian.com/browse/JRASERVER-67303)).
You must specify JavaVM memory size.

### CPU limits

JIRA server consumes much CPU resource on start up and sometimes other pods are killed due to liveness probe on a single core instance.
This chart limits CPU resource to prevent killing other pods by default.
You can safely remove CPU limits on a multi core instance.
