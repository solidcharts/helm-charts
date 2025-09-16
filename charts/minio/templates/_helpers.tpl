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

{{/*
Return MinIO server URL args
*/}}
{{- define "minio.serverUrl" -}}
{{- if .Values.config.serverUrl -}}
{{- printf "--console-address :%d --address :%d" (int .Values.service.ports.console) (int .Values.service.ports.minio) -}}
{{- else -}}
{{- printf "--console-address :%d --address :%d" (int .Values.service.ports.console) (int .Values.service.ports.minio) -}}
{{- end -}}
{{- end }}

{{/*
Return MinIO secret name for root username
*/}}
{{- define "minio.secretNameRootUsername" -}}
{{- if .Values.auth.existingRootUsernameSecret -}}
    {{- .Values.auth.existingRootUsernameSecret -}}
{{- else -}}
    {{- include "minio.fullname" . -}}
{{- end -}}
{{- end }}

{{/*
Return MinIO secret name for root password
*/}}
{{- define "minio.secretNameRootPassword" -}}
{{- if .Values.auth.existingRootPasswordSecret -}}
    {{- .Values.auth.existingRootPasswordSecret -}}
{{- else -}}
    {{- include "minio.fullname" . -}}
{{- end -}}
{{- end }}

{{/*
Return MinIO root user
*/}}
{{- define "minio.secretRootUsernameKey" -}}
{{- if .Values.auth.existingRootUsernameSecretKey -}}
    {{- printf "%s" .Values.auth.existingRootUsernameSecretKey -}}
{{- else -}}
root-user
{{- end -}}
{{- end }}

{{/*
Return MinIO root password
*/}}
{{- define "minio.secretRootPasswordKey" -}}
{{- if .Values.auth.existingRootPasswordSecretKey -}}
    {{- printf "%s" .Values.auth.existingRootPasswordSecretKey -}}
{{- else -}}
root-password
{{- end -}}
{{- end }}
