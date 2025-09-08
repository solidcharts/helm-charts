{{/*
Fullname
*/}}
{{- define "thanos.bucketweb.fullname" -}}
{{ include "shared.fullname" . }}-bucketweb
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.bucketweb.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: bucketweb
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.bucketweb.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: bucketweb
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.bucketweb.serviceAccountName" -}}
{{- if .Values.bucketweb.serviceAccount.create -}}
{{- default (printf "%s-bucketweb" (include "shared.fullname" .)) .Values.bucketweb.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.bucketweb.serviceAccount.name }}
{{- end -}}
{{- end -}}
