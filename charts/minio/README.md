# minio

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)  ![AppVersion: 2025-10-15T17-29-55Z](https://img.shields.io/badge/AppVersion-2025--10--15T17--29--55Z-informational?style=flat-square)  [![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/solidcharts)](https://artifacthub.io/packages/search?repo=solidcharts)

A Helm chart for MinIO.

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
helm upgrade --install minio oci://ghcr.io/solidcharts/helm-charts/minio --version 0.5.0
```

### Non-OCI Repository

Alternatively, you can use the legacy non-OCI method via the following commands:

```shell
helm repo add solidcharts https://solidcharts.github.io/helm-charts/
helm repo update
helm upgrade --install minio solidcharts/minio --version 0.5.0
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/solidcharts/helm-charts | shared | 0.X.X |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| auth.existingRootPasswordSecret | string | `""` |  |
| auth.existingRootPasswordSecretKey | string | `"root-password"` |  |
| auth.existingRootUsernameSecret | string | `""` |  |
| auth.existingRootUsernameSecretKey | string | `"root-user"` |  |
| auth.rootPassword | string | `""` |  |
| auth.rootUsername | string | `"minio"` |  |
| config.browserEnabled | bool | `true` |  |
| config.domain | string | `""` |  |
| config.region | string | `""` |  |
| config.serverUrl | string | `""` |  |
| containerPorts.console | int | `9090` |  |
| containerPorts.minio | int | `9000` |  |
| extraEnv | list | `[]` | Additional environment variables for the minio container. |
| fullnameOverride | string | `""` |  |
| global.imageRegistry | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"coollabsio/minio"` | Image repository |
| image.tag | string | `"2025-10-15T17-29-55Z"` | Image tag version (if not specified, it will use the chart appVersion) |
| imagePullSecrets | list | `[]` | Image pull secrets for pulling an image from a private repository |
| ingress.console.annotations | object | `{}` | Annotations to add to the ingress |
| ingress.console.enabled | bool | `false` | If `true`, create an Ingress for MinIO Console |
| ingress.console.hosts[0].host | string | `"minio-console.local"` |  |
| ingress.console.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.console.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.console.ingressClassName | string | `""` | Ingress class name |
| ingress.console.tls | list | `[]` |  |
| ingress.minio.annotations | object | `{}` | Annotations to add to the ingress |
| ingress.minio.enabled | bool | `false` | If `true`, create an Ingress for MinIO API |
| ingress.minio.hosts[0].host | string | `"minio.local"` |  |
| ingress.minio.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.minio.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.minio.ingressClassName | string | `""` | Ingress class name |
| ingress.minio.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/minio/health/live"` |  |
| livenessProbe.httpGet.port | string | `"minio"` |  |
| livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` | Annotations to add to the pod PVC. |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` |  |
| persistence.mountPath | string | `"/mnt/data"` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1001` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/minio/health/ready"` |  |
| readinessProbe.httpGet.port | string | `"minio"` |  |
| readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `5` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `3` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `1001` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1001` |  |
| service.annotations | object | `{}` | Service annotations |
| service.ports.console | int | `9090` |  |
| service.ports.minio | int | `9000` |  |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automountToken | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` | If this is set and `serviceAccount.create` is `true` this will be used for the created component service account name, if this is set and `serviceAccount.create` is `false` then this will define an existing service account to use for the pod |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling. |
| updateStrategy.type | string | `"Recreate"` |  |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
