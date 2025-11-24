{{/*
Name of the component
*/}}
{{- define "thanos.query.name" -}}
{{- default "query" .Values.query.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.query.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.query.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.query.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.query.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.query.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.query.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.query.serviceAccountName" -}}
{{- if .Values.query.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.query.name" .)) .Values.query.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.query.serviceAccount.name }}
{{- end -}}
{{- end -}}
