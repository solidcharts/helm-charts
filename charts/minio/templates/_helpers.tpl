{{/*
Name of the chart.
*/}}
{{- define "minio.name" -}}
{{- include "shared.name" . -}}
{{- end }}

{{/*
Default fully qualified app name.
*/}}
{{- define "minio.fullname" -}}
{{- include "shared.fullname" . -}}
{{- end }}

{{/*
Chart name and version as used by the chart label.
*/}}
{{- define "minio.chart" -}}
{{- include "shared.chart" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "minio.labels" -}}
{{ include "shared.labels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "minio.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "minio.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "minio.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Rabbit image to use
*/}}
{{- define "minio.image" -}}
{{- include "shared.image" (dict "chart" .Chart "image" .Values.image "global" .Values.global) -}}
{{- end }}
