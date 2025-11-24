{{/* 
Name of the component 
*/}}
{{- define "thanos.receiverRouter.name" -}}
{{- default "receiver-router" .Values.receiver.router.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.receiverRouter.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.receiverRouter.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiverRouter.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.receiverRouter.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiverRouter.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.receiverRouter.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receiverRouter.serviceAccountName" -}}
{{- if .Values.receiver.router.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.receiverRouter.name" .)) .Values.receiver.router.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receiver.router.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Hashrings configmap name
*/}}
{{- define "thanos.receiverRouter.hashringsConfigmapName" -}}
{{ include "thanos.receiverRouter.fullname" . }}-hashrings
{{- end -}}

{{/*
Hashring default config
*/}}
{{- define "thanos.receiverRouter.hashringDefaultConfig" -}}
hashring: default
tenants: []
endpoints:
  {{- include "thanos.receiverIngestor.endpoints" . | nindent 2 }}
{{- end }}
