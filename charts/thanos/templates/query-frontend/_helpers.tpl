{{/*
Name of the component
*/}}
{{- define "thanos.queryFrontend.name" -}}
{{- default "query-frontend" .Values.queryFrontend.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.queryFrontend.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.queryFrontend.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.queryFrontend.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.queryFrontend.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.queryFrontend.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.queryFrontend.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.queryFrontend.serviceAccountName" -}}
{{- if .Values.queryFrontend.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.queryFrontend.name" .)) .Values.queryFrontend.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.queryFrontend.serviceAccount.name }}
{{- end -}}
{{- end -}}
