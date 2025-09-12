{{/* Get Ingress API Version */}}
{{- define "shared.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "shared.ingress.isStable" -}}
  {{- eq (include "shared.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "shared.pvc.persistentVolumeClaimRetentionPolicySupported" -}}
  {{- (semverCompare ">= 1.27-0" .Capabilities.KubeVersion.Version) -}}
{{- end -}}

{{/* Check Ingress supports pathType */}}
{{/* pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18 */}}
{{- define "shared.ingress.supportsPathType" -}}
  {{- or (eq (include "shared.ingress.isStable" .) "true") (and (eq (include "shared.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/* Get PodDisruptionBudget API Version */}}
{{- define "shared.pdb.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "policy/v1") (semverCompare ">= 1.21-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "policy/v1" -}}
  {{- else -}}
    {{- print "policy/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Get HorizontalPodAutoscaler API Version */}}
{{- define "shared.hpa.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "autoscaling/v2") (semverCompare ">= 1.23-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "autoscaling/v2" -}}
  {{- else -}}
    {{- print "autoscaling/v2beta2" -}}
  {{- end -}}
{{- end -}}
