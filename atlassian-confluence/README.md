# Atlassian Confluence

This chart bootstraps an Atlassian Confluence server using [the official image](https://hub.docker.com/r/atlassian/confluence-server).


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`confluence.reverseProxyHost` | Hostname of the server. | `confluence.example.com`
`confluence.reverseProxyPort` | Port of the server. | `443`
`confluence.reverseProxyScheme` | `http` or `https`. | `https`
`confluence.javaHeapSize` | JavaVM memory size passed as `-Xmx` and `-Xms`. | `1024m`
`confluence.javaOptions` | JavaVM options. | ``
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

This chart passes the option `-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap` to JavaVM in order to prevent OOM killing.
It calculates Java memory size but Confluence server always requires `-Xms` and `-Xmx` options so you cannot omit `confluence.javaHeapSize`.


### CPU limits

Confluence server consumes much CPU resource on start up and sometimes other pods are killed due to liveness probe on a single core instance.
This chart limits CPU resource to prevent killing other pods by default.
You can safely remove CPU limits on a multi core instance.
