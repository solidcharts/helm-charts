{{/*
Fullname
*/}}
{{- define "thanos.receiverIngestor.fullname" -}}
{{ include "shared.fullname" . }}-receiver-ingestor
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiverIngestor.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: receiver-ingestor
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiverIngestor.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: receiver-ingestor
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receiverIngestor.serviceAccountName" -}}
{{- if .Values.receiver.ingestor.serviceAccount.create -}}
{{- default (printf "%s-receiver-ingestor" (include "shared.fullname" .)) .Values.receiver.ingestor.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receiver.ingestor.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Fullname
*/}}
{{- define "thanos.receiverIngestor.serviceNameHeadless" -}}
{{ printf "%s-headless" (include "thanos.receiverIngestor.fullname" .) }}
{{- end }}