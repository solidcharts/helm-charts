# rabbitmq

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.1.4-management](https://img.shields.io/badge/AppVersion-4.1.4--management-informational?style=flat-square)

A Helm chart for RabbitMQ

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| pnowy | <solidcharts@przemeknowak.com> |  |

## Source Code

* <https://github.com/solidcharts/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart you can use the following command:

```shell
helm upgrade --install rabbitmq oci://ghcr.io/solidcharts/helm-charts/rabbitmq --version 0.4.0
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/solidcharts/helm-charts | shared | 0.X.X |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalPlugins | list | `[]` |  |
| affinity | object | `{}` | Affinity settings for scheduling. |
| auth.enabled | bool | `true` |  |
| auth.erlangCookie | string | `""` |  |
| auth.existingErlangCookieSecret | string | `""` |  |
| auth.existingErlangCookieSecretKey | string | `"erlang-cookie"` |  |
| auth.existingPasswordSecret | string | `""` |  |
| auth.existingPasswordSecretKey | string | `"password"` |  |
| auth.password | string | `""` |  |
| auth.username | string | `"admin"` |  |
| clusterDomain | string | `"cluster.local"` | _Kubernetes_ cluster domain. |
| config.advancedConfiguration | string | `nil` |  |
| config.extraConfiguration | string | `nil` |  |
| config.memoryHighWatermark.enabled | bool | `false` |  |
| config.memoryHighWatermark.type | string | `"relative"` |  |
| config.memoryHighWatermark.value | float | `0.4` |  |
| containerPorts.amqp | int | `5672` |  |
| containerPorts.dist | int | `25672` |  |
| containerPorts.epmd | int | `4369` |  |
| containerPorts.metrics | int | `15692` |  |
| containerPorts.mgmt | int | `15672` |  |
| extraArgs | list | `[]` | Additional args for the query pod default container. |
| extraEnv | list | `[]` | Additional environment variables for the query pod default container. |
| extraVolumeMounts | list | `[]` | Extra volume mounts for the pod default container. |
| extraVolumes | list | `[]` | Extra volumes for the pod. |
| fullnameOverride | string | `""` |  |
| global.imageRegistry | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Sets the pull policy for images |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"rabbitmq"` | Image repository |
| image.tag | string | `"4.1.4-management"` | Image tag version (if not specified, it will use the chart appVersion) |
| imagePullSecrets | list | `[]` | Image pull secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| ingress.annotations | object | `{}` | Annotations to add to the ingress |
| ingress.enabled | bool | `false` | If `true`, create an `Ingress` |
| ingress.hosts | list | `[{"host":"rabbitmq.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Hosts for the ingress. |
| ingress.ingressClassName | string | `""` | Ingress class name |
| ingress.tls | list | `[]` | TLS configuration for the service ingress |
| initContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| initContainer.image.registry | string | `"docker.io"` |  |
| initContainer.image.repository | string | `"busybox"` |  |
| initContainer.image.tag | string | `"1.37.0"` |  |
| initContainer.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| initContainer.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| initContainer.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| initContainer.securityContext.runAsGroup | int | `999` |  |
| initContainer.securityContext.runAsNonRoot | bool | `true` |  |
| initContainer.securityContext.runAsUser | int | `999` |  |
| installPlugins | list | `[]` |  |
| livenessProbe.exec.command[0] | string | `"/bin/bash"` |  |
| livenessProbe.exec.command[1] | string | `"-ec"` |  |
| livenessProbe.exec.command[2] | string | `"rabbitmq-diagnostics -q check_running"` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.initialDelaySeconds | int | `120` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `20` |  |
| managementPlugin.enabled | bool | `true` |  |
| metrics.enabled | bool | `false` |  |
| metrics.serviceMonitor.annotations | object | `{}` |  |
| metrics.serviceMonitor.enabled | bool | `false` | If `true`, create a ServiceMonitor for the Prometheus Operator |
| metrics.serviceMonitor.endpointConfig | object | `{"interval":"30s","path":"/metrics","scrapeTimeout":"10s"}` | Endpoint configuration for the service monitor endpoint. |
| metrics.serviceMonitor.jobLabel | string | `nil` | Label to use as the `jobLabel`. |
| metrics.serviceMonitor.labels | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node selector labels for scheduling. |
| peerDiscoveryK8sPlugin.addressType | string | `"hostname"` |  |
| peerDiscoveryK8sPlugin.enabled | bool | `false` |  |
| peerDiscoveryK8sPlugin.useLongname | bool | `true` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` | Annotations to add to the pod PVC. |
| persistence.enabled | bool | `true` |  |
| persistence.retainDeleted | bool | `true` | If `true`, retain the PVC after the pod is deleted. |
| persistence.retainScaled | bool | `true` | If `true`, retain the PVC after the pod is scaled down. |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| podSecurityContext.fsGroup | int | `999` |  |
| rbac.create | bool | `true` | If `true`, create and use RBAC resources |
| readinessProbe.exec.command[0] | string | `"/bin/bash"` |  |
| readinessProbe.exec.command[1] | string | `"-ec"` |  |
| readinessProbe.exec.command[2] | string | `"rabbitmq-diagnostics -q check_running"` |  |
| readinessProbe.failureThreshold | int | `1` |  |
| readinessProbe.initialDelaySeconds | int | `0` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicas | int | `1` | Number of replicas to create. |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `999` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `999` |  |
| service.ports.amqp | int | `5672` | RabbitMQ AMQP service port |
| service.ports.dist | int | `25672` | RabbitMQ Erlang distribution service port |
| service.ports.epmd | int | `4369` | RabbitMQ epmd service port |
| service.ports.metrics | int | `15692` | RabbitMQ metrics service port |
| service.ports.mgmt | int | `15672` | RabbitMQ HTTP management service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the account. |
| serviceAccount.automountToken | bool | `true` | Automount API credentials for the account. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the component. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created component service account name, if this is set and `serviceAccount.create` is `false` then this will define an existing service account to use for the component. |
| tolerations | list | `[]` | Node taints the query pod will tolerate for scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling. |
| updateStrategy | object | `{}` | Update strategy for the stateful set. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
