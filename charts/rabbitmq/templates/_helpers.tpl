{{/*
Name of the chart.
*/}}
{{- define "rabbitmq.name" -}}
{{- include "shared.name" . -}}
{{- end }}

{{/*
Default fully qualified app name.
*/}}
{{- define "rabbitmq.fullname" -}}
{{- include "shared.fullname" . -}}
{{- end }}

{{/*
Chart name and version as used by the chart label.
*/}}
{{- define "rabbitmq.chart" -}}
{{- include "shared.chart" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rabbitmq.labels" -}}
{{ include "shared.labels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rabbitmq.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rabbitmq.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rabbitmq.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
