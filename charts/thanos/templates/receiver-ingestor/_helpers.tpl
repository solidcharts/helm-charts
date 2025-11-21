{{/*
Name of the component
*/}}
{{- define "thanos.receiverIngestor.name" -}}
{{- default "receiver-ingestor" .Values.receiver.ingestor.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.receiverIngestor.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.receiverIngestor.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiverIngestor.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.receiverIngestor.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiverIngestor.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.receiverIngestor.name" . }}
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

{{/*
Endpoints
*/}}
{{- define "thanos.receiverIngestor.endpoints" -}}
{{- range (until (.Values.receiver.ingestor.replicas | int)) }}
{{ printf "- %s" ((printf "%s-%s.%s-headless.%s.svc.%s:%d" (include "thanos.receiverIngestor.fullname" $) (toString .) (include "thanos.receiverIngestor.fullname" $) $.Release.Namespace $.Values.clusterDomain (int $.Values.receiver.ingestor.service.ports.grpc)) | quote) }}
{{- end }}
{{- end -}}
