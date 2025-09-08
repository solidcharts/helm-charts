{{/*
Fullname
*/}}
{{- define "thanos.storeGateway.fullname" -}}
{{ include "shared.fullname" . }}-store-gateway
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.storeGateway.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.storeGateway.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.storeGateway.serviceAccountName" -}}
{{- if .Values.storeGateway.serviceAccount.create -}}
{{- default (printf "%s-store-gateway" (include "shared.fullname" .)) .Values.storeGateway.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.storeGateway.serviceAccount.name }}
{{- end -}}
{{- end -}}
