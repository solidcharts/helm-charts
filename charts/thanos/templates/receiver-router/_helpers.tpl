{{/*
Fullname
*/}}
{{- define "thanos.receiverRouter.fullname" -}}
{{ include "shared.fullname" . }}-receiver-router
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiverRouter.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: receiver-router
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiverRouter.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: receiver-router
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receiverRouter.serviceAccountName" -}}
{{- if .Values.receiver.router.serviceAccount.create -}}
{{- default (printf "%s-receiver-router" (include "shared.fullname" .)) .Values.receiver.router.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receiver.router.serviceAccount.name }}
{{- end -}}
{{- end -}}
