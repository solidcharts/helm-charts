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

{{/*
Rabbit image to use
*/}}
{{- define "rabbitmq.image" -}}
{{- include "shared.image" (dict "chart" .Chart "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
Rabbit init container image to use
*/}}
{{- define "rabbitmq.initContainer.image" -}}
{{- include "shared.image" (dict "chart" .Chart "image" .Values.initContainer.image "global" .Values.global) -}}
{{- end }}

{{/*
Service name for headless service
*/}}
{{- define "rabbitmq.serviceNameHeadless" -}}
{{ printf "%s-headless" (include "rabbitmq.fullname" .) }}
{{- end }}

{{/*
Service name for headless service
*/}}
{{- define "rabbitmq.peerDiscoveryRoleName" -}}
{{ printf "%s-peer-discovery" (include "rabbitmq.fullname" .) }}
{{- end }}

{{/*
Name of the config map for RabbitMQ configuration
*/}}
{{- define "rabbitmq.configMapName" -}}
{{ printf "%s-config" (include "rabbitmq.fullname" .) }}
{{- end }}

{{/*
Get the secret name for RabbitMQ password
*/}}
{{- define "rabbitmq.secretNamePassword" -}}
{{- if .Values.auth.existingPasswordSecret }}
{{- .Values.auth.existingPasswordSecret }}
{{- else }}
{{- include "rabbitmq.fullname" . }}
{{- end }}
{{- end }}

{{/*
Get the secret key for RabbitMQ password
*/}}
{{- define "rabbitmq.secretPasswordKey" -}}
{{- if .Values.auth.existingPasswordSecretKey }}
{{- .Values.auth.existingPasswordSecretKey }}
{{- else }}password
{{- end }}
{{- end }}

{{/*
Get the secret name for RabbitMQ earlang cookie
*/}}
{{- define "rabbitmq.secretNameErlangCookie" -}}
{{- if .Values.auth.existingErlangCookieSecret }}
{{- .Values.auth.existingErlangCookieSecret }}
{{- else }}
{{- include "rabbitmq.fullname" . }}
{{- end }}
{{- end }}

{{/*
Get the secret key for Erlang cookie
*/}}
{{- define "rabbitmq.secretErlangCookieKey" -}}
{{- if .Values.auth.existingErlangCookieSecretKey }}
{{- .Values.auth.existingErlangCookieSecretKey }}
{{- else }}erlang-cookie
{{- end }}
{{- end }}

{{/*
Extract plugin name from plugin URL
*/}}
{{- define "rabbitmq.pluginNameFromUrl" -}}
{{- $url := . -}}
{{- $filename := (regexReplaceAll ".*/" $url "") -}}
{{- $filename = (regexReplaceAll "-[0-9]+\\.[0-9]+\\.[0-9]+.*" $filename "") -}}
{{- $filename -}}
{{- end -}}
