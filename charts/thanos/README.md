# thanos

![Version: 0.2.0-rc.2](https://img.shields.io/badge/Version-0.2.0--rc.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.39.2](https://img.shields.io/badge/AppVersion-0.39.2-informational?style=flat-square)

## Description

This chart is a replacement for Bitnami Thanos chart.

**Homepage:** <https://thanos.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| pnowy | <solidcharts@przemeknowak.com> |  |

## Source Code

* <https://github.com/thanos-io/thanos>
* <https://github.com/thanos-io/kube-thanos>
* <https://github.com/solidcharts/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart you can use the following command:

```shell
helm upgrade --install thanos oci://ghcr.io/solidcharts/helm-charts/thanos --version 0.2.0-rc.2
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/solidcharts/helm-charts | shared | 0.X.X |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEndpointGroups | list | `[]` | Additional endpoint groups external to the chart to be configured with `--endpoint-group`. |
| additionalEndpoints | list | `[]` | Additional endpoints external to the chart to be configured with `--endpoint`. |
| additionalReplicaLabels | list | `[]` | Additional replica labels external to the chart. |
| autoGomemlimit.enabled | bool | `false` | If `true`, enable the go runtime to automatically limit memory consumption for all Thanos components by setting GOMEMLIMIT. |
| autoGomemlimit.ratio | float | `nil` | The ratio of reserved GOMEMLIMIT memory to the detected maximum container or system memory. |
| bucketweb.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the bucket web deployment. |
| bucketweb.autoscaling.maxReplicas | int | `3` | Maximum number of bucket web replicas that the HPA should create. |
| bucketweb.autoscaling.minReplicas | int | `1` | Minimum number of bucket web replicas that the HPA should maintain. |
| bucketweb.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization percentage for the bucket web pod. |
| bucketweb.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilization percentage for the bucket web pod. |
| bucketweb.containerPorts.http | int | `10902` |  |
| bucketweb.enabled | bool | `false` | If `true`, create the bucket web component. |
| bucketweb.extraArgs | list | `[]` | Additional args for the bucket web pod default container. |
| bucketweb.extraEnv | list | `[]` | Additional environment variables for the bucket web pod default container. |
| bucketweb.extraVolumeMounts | list | `[]` | Extra volume mounts for the bucket web pod default container. |
| bucketweb.extraVolumes | list | `[]` | Extra volumes for the bucket web pod. |
| bucketweb.ingress.annotations | object | `{}` | Annotations to add to the bucket web service ingress. |
| bucketweb.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the bucket web service. |
| bucketweb.ingress.hosts | list | See _values.yaml_ | Hosts for the bucket web service ingress. |
| bucketweb.ingress.ingressClassName | string | `nil` | Ingress class name for the bucket web service ingress. |
| bucketweb.ingress.tls | list | See _values.yaml_ | TLS configuration for the bucket web service ingress. |
| bucketweb.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the bucket web pod default container. |
| bucketweb.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the bucket web deployment. |
| bucketweb.pdb.maxUnavailable | string | `nil` | Maximum number of bucket web replicas that the PDB should allow to be unavailable. |
| bucketweb.pdb.minAvailable | string | `nil` | Minimum number of bucket web replicas that the PDB should require to be available. |
| bucketweb.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the bucket web PDB. |
| bucketweb.podAnnotations | object | `{}` | Annotations to add to the bucket web pod. |
| bucketweb.podLabels | object | `{}` | Labels to add to the bucket web pod. |
| bucketweb.podSecurityContext | object | See _values.yaml_ | Security context for the bucket web pod. |
| bucketweb.priorityClassName | string | `nil` | Priority class name for the bucket web pod. |
| bucketweb.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the bucket web pod default container. |
| bucketweb.refresh | string | `"30m"` | Refresh interval to download metadata from remote storage |
| bucketweb.replicas | int | `1` | Number of bucket web replicas to create. |
| bucketweb.resources | object | `{}` | Resources for the bucket web pod default container. |
| bucketweb.securityContext | object | See _values.yaml_ | Security context for the bucket web pod default container. |
| bucketweb.service.annotations | object | `{}` | Annotations to add to the service. |
| bucketweb.service.ports | int | `{"http":10902}` | Port for the service. |
| bucketweb.service.trafficDistribution | string | `nil` | Traffic distribution for service. |
| bucketweb.service.type | string | `"ClusterIP"` | Service type for the service. |
| bucketweb.serviceAccount.annotations | object | `{}` | Annotations to add to the bucket web service account. |
| bucketweb.serviceAccount.automountToken | bool | `false` | Automount API credentials for the bucket web service account. |
| bucketweb.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the component. |
| bucketweb.serviceAccount.labels | object | `{}` | Labels to add to the bucket web service account. |
| bucketweb.serviceAccount.name | string | `nil` | If this is set and `bucketweb.serviceAccount.create` is `true` this will be used for the created bucket web component service account name, if this is set and `bucketweb.serviceAccount.create` is `false` then this will define an existing service account to use for the bucket web component. |
| bucketweb.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the bucket web pod; in seconds. |
| bucketweb.timeout | string | `"5m"` | Timeout to download metadata from remote storage |
| bucketweb.updateStrategy | object | `{}` | Update strategy for the bucket web deployment. |
| clusterDomain | string | `"cluster.local"` | _Kubernetes_ cluster domain. |
| compactor.containerPorts.http | int | `10902` |  |
| compactor.deduplication.enabled | bool | `true` | If `true`, enable deduplication via the compactor component. |
| compactor.deduplication.func | string | `nil` | If specified override the default deduplication function. |
| compactor.enabled | bool | `false` | If `true`, create component. |
| compactor.extraArgs | list | `[]` | Additional args for the compactor pod default container. |
| compactor.extraEnv | list | `[]` | Additional environment variables for the compactor pod default container. |
| compactor.extraVolumeMounts | list | `[]` | Extra volume mounts for the compactor pod default container. |
| compactor.extraVolumes | list | `[]` | Extra volumes for the compactor pod. |
| compactor.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the compactor pod default container. |
| compactor.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the compactor pod PVC. |
| compactor.persistence.annotations | object | `{}` | Annotations to add to the compactor pod PVC. |
| compactor.persistence.enabled | bool | `false` | If `true`, create a `PersistentVolumeClaim` for the compactor pod data. |
| compactor.persistence.retainDeleted | bool | `true` | If `true`, retain the compactor PVC after the pod is deleted. |
| compactor.persistence.retainScaled | bool | `true` | If `true`, retain the compactor PVC after the pod is scaled down. |
| compactor.persistence.size | string | `"8Gi"` | Size for the compactor pod PVC. |
| compactor.persistence.storageClass | string | `""` | Storage class for the pod PVC. |
| compactor.podAnnotations | object | `{}` | Annotations to add to the compactor pod. |
| compactor.podLabels | object | `{}` | Labels to add to the compactor pod. |
| compactor.podSecurityContext | object | See _values.yaml_ | Security context for the compactor pod. |
| compactor.priorityClassName | string | `nil` | Priority class name for the compactor pod. |
| compactor.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the compactor pod default container. |
| compactor.resources | object | `{}` | Resources for the compactor pod default container. |
| compactor.securityContext | object | See _values.yaml_ | Security context for the compactor pod default container. |
| compactor.service.annotations | object | `{}` | Annotations to add to the compactor service. |
| compactor.service.ports | object | `{"http":10902}` | Service ports |
| compactor.serviceAccount.annotations | object | `{}` | Annotations to add to the compactor service account. |
| compactor.serviceAccount.automountToken | bool | `false` | Automount API credentials for the compactor service account. |
| compactor.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the compactor component. |
| compactor.serviceAccount.labels | object | `{}` | Labels to add to the compactor service account. |
| compactor.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created compactor component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the compactor component. |
| compactor.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the compactor pod; in seconds. |
| compactor.updateStrategy | object | `{}` | Update strategy for the compactor stateful set. |
| components.affinity | object | `{}` | Affinity settings for scheduling the all components. |
| components.nodeSelector | object | `{}` | Node selector labels for scheduling for all components. |
| components.tolerations | list | `[]` | Node taints the query pod will tolerate for scheduling for all components. |
| components.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for all components. |
| fullnameOverride | string | `nil` |  |
| global.imageRegistry | string | `""` |  |
| image.digest | string | `nil` | Set image digest |
| image.pullPolicy | string | `"IfNotPresent"` | Pull policy for images. |
| image.registry | string | `"quay.io"` | Image registry |
| image.repository | string | `"thanos/thanos"` | Image repository |
| image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| logFormat | string | `"logfmt"` | Log format for _Thanos_ components. |
| logLevel | string | `"info"` | Log level for _Thanos_ components. |
| nameOverride | string | `nil` |  |
| objstoreConfig.create | bool | `true` | If `true`, create a `Secret` for the objstore store configuration. |
| objstoreConfig.key | string | `"config"` | Secret key for the objstore configuration. |
| objstoreConfig.name | string | `nil` | If this is set and `objstoreConfig.create` is `true` this will be used for the created secret name, if this is set and `objstoreConfig.create` is `false` then this will define an existing secret to use. |
| objstoreConfig.value | string | `"type: FILESYSTEM\nconfig:\n  directory: /var/thanos/store/s3"` | Objstore configuration; this can either be a string or a map. The default values are not suitable for production. |
| query.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the query deployment. |
| query.autoscaling.maxReplicas | int | `3` | Maximum number of query replicas that the HPA should create. |
| query.autoscaling.minReplicas | int | `1` | Minimum number of query replicas that the HPA should maintain. |
| query.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilisation percentage for the query pod. |
| query.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilisation percentage for the query pod. |
| query.containerPorts.grpc | int | `10901` |  |
| query.containerPorts.http | int | `10902` |  |
| query.enableDnsDiscovery | bool | `true` | Enable DNS service discovery. |
| query.enabled | bool | `true` | If `true`, create component. |
| query.extraArgs | list | `[]` | Additional args for the query pod default container. |
| query.extraEnv | list | `[]` | Additional environment variables for the query pod default container. |
| query.extraVolumeMounts | list | `[]` | Extra volume mounts for the query pod default container. |
| query.extraVolumes | list | `[]` | Extra volumes for the query pod. |
| query.ingress.annotations | object | `{}` | Annotations to add to the query service ingress. |
| query.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the query service. |
| query.ingress.hosts | list | See _values.yaml_ | Hosts for the query service ingress. |
| query.ingress.ingressClassName | string | `nil` | Ingress class name for the query service ingress. |
| query.ingress.tls | list | See _values.yaml_ | TLS configuration for the query service ingress. |
| query.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the query pod default container. |
| query.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the query deployment. |
| query.pdb.maxUnavailable | string | `nil` | Maximum number of query replicas that the PDB should allow to be unavailable. |
| query.pdb.minAvailable | string | `nil` | Minimum number of query replicas that the PDB should require to be available. |
| query.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the query PDB. |
| query.podAnnotations | object | `{}` | Annotations to add to the query pod. |
| query.podLabels | object | `{}` | Labels to add to the query pod. |
| query.podSecurityContext | object | See _values.yaml_ | Security context for the query pod. |
| query.priorityClassName | string | `nil` | Priority class name for the query pod. |
| query.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the query pod default container. |
| query.replicas | int | `1` | Number of query replicas to create. |
| query.resources | object | `{}` | Resources for the query pod default container. |
| query.securityContext | object | See _values.yaml_ | Security context for the query pod default container. |
| query.service.annotations | object | `{}` | Annotations to add to service. |
| query.service.ports | object | `{"grpc":10901,"http":10902}` | Service ports |
| query.service.trafficDistribution | string | `nil` | Traffic distribution for the query service. |
| query.service.type | string | `"ClusterIP"` | Service type |
| query.serviceAccount.annotations | object | `{}` | Annotations to add to the query service account. |
| query.serviceAccount.automountToken | bool | `false` | Automount API credentials for the query service account. |
| query.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the query component. |
| query.serviceAccount.labels | object | `{}` | Labels to add to the query service account. |
| query.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created query component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the query component. |
| query.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the query pod; in seconds. |
| query.updateStrategy | object | `{}` | Update strategy for the query deployment. |
| queryFrontend.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the query frontend deployment. |
| queryFrontend.autoscaling.maxReplicas | int | `3` | Maximum number of query frontend replicas that the HPA should create. |
| queryFrontend.autoscaling.minReplicas | int | `1` | Minimum number of query frontend replicas that the HPA should maintain. |
| queryFrontend.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilisation percentage for the query frontend pod. |
| queryFrontend.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilisation percentage for the query frontend pod. |
| queryFrontend.containerPorts.http | int | `10902` |  |
| queryFrontend.enabled | bool | `false` | If `true`, create the _Thanos Query Frontend_ component. |
| queryFrontend.extraArgs | list | `[]` | Additional args for the query frontend pod default container. |
| queryFrontend.extraEnv | list | `[]` | Additional environment variables for the query frontend pod default container. |
| queryFrontend.extraVolumeMounts | list | `[]` | Extra volume mounts for the query frontend pod default container. |
| queryFrontend.extraVolumes | list | `[]` | Extra volumes for the query frontend pod. |
| queryFrontend.ingress.annotations | object | `{}` | Annotations to add to the query frontend service ingress. |
| queryFrontend.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the query frontend service. |
| queryFrontend.ingress.hosts | list | See _values.yaml_ | Hosts for the query frontend service ingress. |
| queryFrontend.ingress.ingressClassName | string | `nil` | Ingress class name for the query frontend service ingress. |
| queryFrontend.ingress.tls | list | See _values.yaml_ | TLS configuration for the query frontend service ingress. |
| queryFrontend.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the query frontend pod default container. |
| queryFrontend.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the query frontend deployment. |
| queryFrontend.pdb.maxUnavailable | string | `nil` | Maximum number of query frontend replicas that the PDB should allow to be unavailable. |
| queryFrontend.pdb.minAvailable | string | `nil` | Minimum number of query frontend replicas that the PDB should require to be available. |
| queryFrontend.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the query frontend PDB. |
| queryFrontend.podAnnotations | object | `{}` | Annotations to add to the query frontend pod. |
| queryFrontend.podLabels | object | `{}` | Labels to add to the query frontend pod. |
| queryFrontend.podSecurityContext | object | See _values.yaml_ | Security context for the query frontend pod. |
| queryFrontend.priorityClassName | string | `nil` | Priority class name for the query frontend pod. |
| queryFrontend.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the query frontend pod default container. |
| queryFrontend.replicas | int | `1` | Number of query frontend replicas to create. |
| queryFrontend.resources | object | `{}` | Resources for the query frontend pod default container. |
| queryFrontend.securityContext | object | See _values.yaml_ | Security context for the query frontend pod default container. |
| queryFrontend.service.annotations | object | `{}` | Annotations to add to the query frontend service. |
| queryFrontend.service.ports.http | int | `10902` |  |
| queryFrontend.service.trafficDistribution | string | `nil` | Traffic distribution for the query frontend service. |
| queryFrontend.service.type | string | `"ClusterIP"` | Service type |
| queryFrontend.serviceAccount.annotations | object | `{}` | Annotations to add to the query frontend service account. |
| queryFrontend.serviceAccount.automountToken | bool | `false` | Automount API credentials for the query frontend service account. |
| queryFrontend.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the query frontend component. |
| queryFrontend.serviceAccount.labels | object | `{}` | Labels to add to the query frontend service account. |
| queryFrontend.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created query frontend component service account name, if this is set and `compactor.serviceAccount.create` is `false` then this will define an existing service account to use for the query frontend component. |
| queryFrontend.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the query frontend pod; in seconds. |
| queryFrontend.updateStrategy | object | `{}` | Update strategy for the query frontend deployment. |
| receiver.enabled | bool | `false` | If `true`, create the receiver ingestor & receiver router components. |
| receiver.httpRemoteWritePort | int | `19291` | HTTP port for remote write |
| receiver.ingestor.affinity | object | `{}` | Affinity settings for scheduling the receiver ingestor pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| receiver.ingestor.containerPorts.grpc | int | `10901` |  |
| receiver.ingestor.containerPorts.http | int | `10902` |  |
| receiver.ingestor.extraArgs | list | `[]` | Additional args for the receiver ingestor pod default container. |
| receiver.ingestor.extraEnv | list | `[]` | Additional environment variables for the receiver ingestor pod default container. |
| receiver.ingestor.extraVolumeMounts | list | `[]` | Extra volume mounts for the receiver ingestor pod default container. |
| receiver.ingestor.extraVolumes | list | `[]` | Extra volumes for the receiver ingestor pod. |
| receiver.ingestor.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the receiver ingestor pod default container. |
| receiver.ingestor.nodeSelector | object | `{}` | Node selector labels for scheduling the receiver ingestor pod. |
| receiver.ingestor.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the receiver ingestor stateful set. |
| receiver.ingestor.pdb.maxUnavailable | string | `nil` | Maximum number of receiver ingestor replicas that the PDB should allow to be unavailable. |
| receiver.ingestor.pdb.minAvailable | string | `nil` | Minimum number of receiver ingestor replicas that the PDB should require to be available. |
| receiver.ingestor.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the receiver ingestor PDB. |
| receiver.ingestor.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the receiver ingestor pod PVC. |
| receiver.ingestor.persistence.annotations | object | `{}` | Annotations to add to the receiver ingestor pod PVC. |
| receiver.ingestor.persistence.enabled | bool | `false` | If `true`, create a `PersistentVolumeClaim` for the receiver ingestor pod data. |
| receiver.ingestor.persistence.retainDeleted | bool | `true` | If `true`, retain the receiver ingestor PVC after the pod is deleted. |
| receiver.ingestor.persistence.retainScaled | bool | `true` | If `true`, retain the receiver ingestor PVC after the pod is scaled down. |
| receiver.ingestor.persistence.size | string | `"8Gi"` | Size for the receiver ingestor pod PVC. |
| receiver.ingestor.persistence.storageClass | string | `""` | Storage class for the receiver ingestor pod PVC. |
| receiver.ingestor.podAnnotations | object | `{}` | Annotations to add to the receiver ingestor pod. |
| receiver.ingestor.podLabels | object | `{}` | Labels to add to the receiver ingestor pod. |
| receiver.ingestor.podSecurityContext | object | See _values.yaml_ | Security context for the receiver ingestor pod. |
| receiver.ingestor.priorityClassName | string | `nil` | Priority class name for the receiver ingestor pod. |
| receiver.ingestor.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the receiver ingestor pod default container. |
| receiver.ingestor.replicas | int | `1` | Number of receiver ingestor replicas to create. |
| receiver.ingestor.resources | object | `{}` | Resources for the receiver ingestor pod default container. |
| receiver.ingestor.securityContext | object | See _values.yaml_ | Security context for the receiver ingestor pod default container. |
| receiver.ingestor.service.annotations | object | `{}` | Annotations to add to the receiver ingestor service. |
| receiver.ingestor.service.ports | object | `{"grpc":10901,"http":10902}` | Service ports |
| receiver.ingestor.serviceAccount.annotations | object | `{}` | Annotations to add to the receiver ingestor service account. |
| receiver.ingestor.serviceAccount.automountToken | bool | `false` | Automount API credentials for the receiver ingestor service account. |
| receiver.ingestor.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the receiver ingestor component. |
| receiver.ingestor.serviceAccount.labels | object | `{}` | Labels to add to the receiver ingestor service account. |
| receiver.ingestor.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created receiver ingestor component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the receiver ingestor component. |
| receiver.ingestor.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the receiver ingestor pod; in seconds. |
| receiver.ingestor.tolerations | list | `[]` | Node taints the receiver ingestor pod will tolerate for scheduling. |
| receiver.ingestor.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the receiver ingestor pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| receiver.ingestor.updateStrategy | object | `{}` | Update strategy for the receiver ingestor stateful set. |
| receiver.replicationFactor | int | `1` | Replication factor for the receiver components. |
| receiver.retention | string | `"48h"` | Retention for the receiver components. |
| receiver.router.affinity | object | `{}` | Affinity settings for scheduling the receiver router pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| receiver.router.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the receiver router deployment. |
| receiver.router.autoscaling.maxReplicas | int | `3` | Maximum number of receiver router replicas that the HPA should create. |
| receiver.router.autoscaling.minReplicas | int | `1` | Minimum number of receiver router replicas that the HPA should maintain. |
| receiver.router.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilisation percentage for the receiver router pod. |
| receiver.router.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilisation percentage for the receiver router pod. |
| receiver.router.containerPorts.grpc | int | `10901` |  |
| receiver.router.containerPorts.http | int | `10902` |  |
| receiver.router.extraArgs | list | `[]` | Additional args for the receiver router pod default container. |
| receiver.router.extraEnv | list | `[]` | Additional environment variables for the receiver router pod default container. |
| receiver.router.extraVolumeMounts | list | `[]` | Extra volume mounts for the receiver router pod default container. |
| receiver.router.extraVolumes | list | `[]` | Extra volumes for the receiver router pod. |
| receiver.router.ingress.annotations | object | `{}` | Annotations to add to the receiver router service ingress. |
| receiver.router.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the receiver router service. |
| receiver.router.ingress.hosts | list | See _values.yaml_ | Hosts for the receiver router service ingress. |
| receiver.router.ingress.ingressClassName | string | `nil` | Ingress class name for the receiver router service ingress. |
| receiver.router.ingress.tls | list | See _values.yaml_ | TLS configuration for the receiver router service ingress. |
| receiver.router.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the receiver router pod default container. |
| receiver.router.nodeSelector | object | `{}` | Node selector labels for scheduling the receiver router pod. |
| receiver.router.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the receiver router deployment. |
| receiver.router.pdb.maxUnavailable | string | `nil` | Maximum number of receiver router replicas that the PDB should allow to be unavailable. |
| receiver.router.pdb.minAvailable | string | `nil` | Minimum number of receiver router replicas that the PDB should require to be available. |
| receiver.router.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the receiver router PDB. |
| receiver.router.podAnnotations | object | `{}` | Annotations to add to the receiver router pod. |
| receiver.router.podLabels | object | `{}` | Labels to add to the receiver router pod. |
| receiver.router.podSecurityContext | object | See _values.yaml_ | Security context for the receiver router pod. |
| receiver.router.priorityClassName | string | `nil` | Priority class name for the receiver router pod. |
| receiver.router.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the receiver router pod default container. |
| receiver.router.replicas | int | `1` | Number of receiver router replicas to create. |
| receiver.router.resources | object | `{}` | Resources for the receiver router pod default container. |
| receiver.router.securityContext | object | See _values.yaml_ | Security context for the receiver router pod default container. |
| receiver.router.service.annotations | object | `{}` | Annotations to add to the receiver router service. |
| receiver.router.service.ports | object | `{"grpc":10901,"http":10902}` | Service ports |
| receiver.router.serviceAccount.annotations | object | `{}` | Annotations to add to the receiver router service account. |
| receiver.router.serviceAccount.automountToken | bool | `false` | Automount API credentials for the receiver router service account. |
| receiver.router.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the receiver router component. |
| receiver.router.serviceAccount.labels | object | `{}` | Labels to add to the receiver router service account. |
| receiver.router.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created receiver router component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the receiver router component. |
| receiver.router.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the receiver router pod; in seconds. |
| receiver.router.tolerations | list | `[]` | Node taints the receiver router pod will tolerate for scheduling. |
| receiver.router.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the receiver router pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| receiver.router.updateStrategy | object | `{}` | Update strategy for the receiver router deployment. |
| ruler.alertmanagersConfig.create | bool | `true` | If `true`, create a `Secret` for the ruler component alertmanagers configuration. |
| ruler.alertmanagersConfig.key | string | `"config"` | Secret key for the ruler component alertmanagers configuration. |
| ruler.alertmanagersConfig.name | string | `nil` | If this is set and `rule.alertmanagersConfig.create` is `true` this will be used for the created secret name, if this is set and `rule.alertmanagersConfig.create` is `false` then this will define an existing secret to use. |
| ruler.alertmanagersConfig.value | string | `"alertmanagers: []"` | Alert managers configuration for the ruler component. |
| ruler.blockDuration | string | `"2h"` | Block duration for the ruler component (`--tsdb.block-duration`). |
| ruler.configReloader.enabled | bool | `true` | If `true`, create the ruler pod config reloader sidecar container. |
| ruler.configReloader.extraVolumeMounts | list | `[]` | Extra volume mounts for the ruler pod config reloader sidecar container. |
| ruler.configReloader.image.digest | string | `nil` | Image digest for the ruler pod config reloader sidecar container. |
| ruler.configReloader.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the ruler pod config reloader sidecar container. |
| ruler.configReloader.image.repository | string | `"ghcr.io/jimmidyson/configmap-reload"` | Image repository for the ruler pod config reloader sidecar container. |
| ruler.configReloader.image.tag | string | `"v0.15.0"` | Image tag for the ruler pod config reloader sidecar container. |
| ruler.configReloader.resources | object | `{}` | Resources for the ruler pod config reloader sidecar container. |
| ruler.containerPorts.grpc | int | `10901` |  |
| ruler.containerPorts.http | int | `10902` |  |
| ruler.enabled | bool | `false` | If `true`, create the ruler component. |
| ruler.evalInterval | string | `"1m"` | Rule eval interval for the ruler component (`--eval-interval`). |
| ruler.extraArgs | list | `[]` | Additional args for the ruler pod default container. |
| ruler.extraEnv | list | `[]` | Additional environment variables for the ruler pod default container. |
| ruler.extraVolumeMounts | list | `[]` | Extra volume mounts for the ruler pod default container. |
| ruler.extraVolumes | list | `[]` | Extra volumes for the ruler pod. |
| ruler.ingress.annotations | object | `{}` | Annotations to add to the ruler service ingress. |
| ruler.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the ruler service. |
| ruler.ingress.hosts | list | See _values.yaml_ | Hosts for the ruler service ingress. |
| ruler.ingress.ingressClassName | string | `nil` | Ingress class name for the ruler service ingress. |
| ruler.ingress.tls | list | See _values.yaml_ | TLS configuration for the ruler service ingress. |
| ruler.instanceLabel | bool | `false` | If `true`, add a `thanos_rule` label to `<NAMESPACE>/<RULE_FULLNAME>` on a `Rule` metrics. |
| ruler.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the ruler pod default container. |
| ruler.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the ruler stateful set. |
| ruler.pdb.maxUnavailable | string | `nil` | Maximum number of ruler replicas that the PDB should allow to be unavailable. |
| ruler.pdb.minAvailable | string | `nil` | Minimum number of ruler replicas that the PDB should require to be available. |
| ruler.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the ruler PDB. |
| ruler.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the ruler pod PVC. |
| ruler.persistence.annotations | object | `{}` | Annotations to add to the ruler pod PVC. |
| ruler.persistence.enabled | bool | `false` | If `true`, create a `PersistentVolumeClaim` for the ruler pod data. |
| ruler.persistence.retainDeleted | bool | `true` | If `true`, retain the ruler PVC after the pod is deleted. |
| ruler.persistence.retainScaled | bool | `true` | If `true`, retain the ruler PVC after the pod is scaled down. |
| ruler.persistence.size | string | `"8Gi"` | Size for the ruler pod PVC. |
| ruler.persistence.storageClass | string | `""` | Storage class for the ruler pod PVC. |
| ruler.podAnnotations | object | `{}` | Annotations to add to the ruler pod. |
| ruler.podLabels | object | `{}` | Labels to add to the ruler pod. |
| ruler.podSecurityContext | object | See _values.yaml_ | Security context for the ruler pod. |
| ruler.priorityClassName | string | `nil` | Priority class name for the ruler pod. |
| ruler.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the ruler pod default container. |
| ruler.replicas | int | `1` | Number of ruler replicas to create. |
| ruler.resources | object | `{}` | Resources for the ruler pod default container. |
| ruler.retention | string | `"48h"` | Local disk block retention period for the ruler component (`--tsdb.retention`). |
| ruler.rules.create | bool | `true` | If `true`, create a `ConfigMap` for the ruler component rules. |
| ruler.rules.name | string | `nil` | If this is set and `rule.rules.create` is `true` this will be used for the created config map name, if this is set and `rule.rules.create` is `false` then this will define an existing config map to use. |
| ruler.rules.value | string | `nil` |  |
| ruler.securityContext | object | See _values.yaml_ | Security context for the ruler pod default container. |
| ruler.service.annotations | object | `{}` | Annotations to add to the ruler service. |
| ruler.service.ports | object | `{"grpc":10901,"http":10902}` | Service ports |
| ruler.service.trafficDistribution | string | `nil` | Traffic distribution for service. |
| ruler.service.type | string | `"ClusterIP"` | Service type |
| ruler.serviceAccount.annotations | object | `{}` | Annotations to add to the ruler service account. |
| ruler.serviceAccount.automountToken | bool | `false` | Automount API credentials for the ruler service account. |
| ruler.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the ruler component. |
| ruler.serviceAccount.labels | object | `{}` | Labels to add to the ruler service account. |
| ruler.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created ruler component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the ruler component. |
| ruler.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the ruler pod; in seconds. |
| ruler.updateStrategy | object | `{}` | Update strategy for the ruler stateful set. |
| serviceMonitor.enabled | bool | `false` | If `true`, create `ServiceMonitor` resources to support collecting metrics via the Prometheus Operator |
| serviceMonitor.endpointConfig | object | `{"path":"/metrics"}` | Endpoint configuration for the service monitor endpoint. |
| serviceMonitor.jobLabel | string | `"app.kubernetes.io/component"` | Label to use as the `jobLabel`. |
| serviceMonitor.labels | object | `{}` | Additional labels for the service monitor. |
| storeEndpointGroup | bool | `false` | If `true`, configure the store endpoints with `--endpoint-group` so they're queried round-robin rather than fanout. |
| storeGateway.containerPorts.grpc | int | `10901` |  |
| storeGateway.containerPorts.http | int | `10902` |  |
| storeGateway.enabled | bool | `true` | If `true`, create the store gateway component. |
| storeGateway.extraArgs | list | `[]` | Additional args for the store gateway pod default container. |
| storeGateway.extraEnv | list | `[]` | Additional environment variables for the store gateway pod default container. |
| storeGateway.extraVolumeMounts | list | `[]` | Extra volume mounts for the store gateway pod default container. |
| storeGateway.extraVolumes | list | `[]` | Extra volumes for the store gateway pod. |
| storeGateway.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the store gateway pod default container. |
| storeGateway.pdb.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the store gateway stateful set. |
| storeGateway.pdb.maxUnavailable | string | `nil` | Maximum number of store gateway replicas that the PDB should allow to be unavailable. |
| storeGateway.pdb.minAvailable | string | `nil` | Minimum number of store gateway replicas that the PDB should require to be available. |
| storeGateway.pdb.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the store gateway PDB. |
| storeGateway.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the store gateway pod PVC. |
| storeGateway.persistence.annotations | object | `{}` | Annotations to add to the store gateway pod PVC. |
| storeGateway.persistence.enabled | bool | `false` | If `true`, create a `PersistentVolumeClaim` for the store gateway pod data. |
| storeGateway.persistence.retainDeleted | bool | `true` | If `true`, retain the store gateway PVC after the pod is deleted. |
| storeGateway.persistence.retainScaled | bool | `true` | If `true`, retain the store gateway PVC after the pod is scaled down. |
| storeGateway.persistence.size | string | `"8Gi"` | Size for the store gateway pod PVC. |
| storeGateway.persistence.storageClass | string | `""` | Storage class for the store gateway pod PVC. |
| storeGateway.podAnnotations | object | `{}` | Annotations to add to the store gateway pod. |
| storeGateway.podLabels | object | `{}` | Labels to add to the store gateway pod. |
| storeGateway.podSecurityContext | object | See _values.yaml_ | Security context for the store gateway pod. |
| storeGateway.priorityClassName | string | `nil` | Priority class name for the store gateway pod. |
| storeGateway.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the store gateway pod default container. |
| storeGateway.replicas | int | `1` | Number of store gateway replicas to create. |
| storeGateway.resources | object | `{}` | Resources for the store gateway pod default container. |
| storeGateway.securityContext | object | See _values.yaml_ | Security context for the store gateway pod default container. |
| storeGateway.service.annotations | object | `{}` | Annotations to add to the store gateway service. |
| storeGateway.service.ports | object | `{"grpc":10901,"http":10902}` | Service ports |
| storeGateway.service.trafficDistribution | string | `nil` | Traffic distribution for the store gateway service. |
| storeGateway.serviceAccount.annotations | object | `{}` | Annotations to add to the store gateway service account. |
| storeGateway.serviceAccount.automountToken | bool | `false` | Automount API credentials for the store gateway service account. |
| storeGateway.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the store gateway component. |
| storeGateway.serviceAccount.labels | object | `{}` | Labels to add to the store gateway service account. |
| storeGateway.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created store gateway component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the store gateway component. |
| storeGateway.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the store gateway pod; in seconds. |
| storeGateway.updateStrategy | object | `{}` | Update strategy for the store gateway stateful set. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
