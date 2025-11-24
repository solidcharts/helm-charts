{{/*
Name of the component
*/}}
{{- define "thanos.storeGateway.name" -}}
{{- default "store-gateway" .Values.storeGateway.nameOverride -}}
{{- end }} 

{{/*
Fullname
*/}}
{{- define "thanos.storeGateway.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.storeGateway.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.storeGateway.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.storeGateway.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.storeGateway.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.storeGateway.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.storeGateway.serviceAccountName" -}}
{{- if .Values.storeGateway.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.storeGateway.name" .)) .Values.storeGateway.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.storeGateway.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Fullname
*/}}
{{- define "thanos.storeGateway.serviceNameHeadless" -}}
{{ printf "%s-headless" (include "thanos.storeGateway.fullname" .) }}
{{- end }}

{{/*
Mount path for data volume
*/}}
{{- define "thanos.storeGateway.dataMountPath" -}}
{{- default "/var/thanos/store" .Values.storeGateway.mountPath -}}
{{- end }}