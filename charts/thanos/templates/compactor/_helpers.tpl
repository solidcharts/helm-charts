{{/*
Fullname
*/}}
{{- define "thanos.compactor.fullname" -}}
{{ include "shared.fullname" . }}-compactor
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.compactor.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: compactor
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.compactor.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: compactor
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.compactor.serviceAccountName" -}}
{{- if .Values.compactor.serviceAccount.create -}}
{{- default (printf "%s-compactor" (include "shared.fullname" .)) .Values.compactor.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.compactor.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Fullname
*/}}
{{- define "thanos.compactor.serviceName" -}}
{{ printf "%s-headless" (include "thanos.compactor.fullname" .) }}
{{- end }}