{{/*
Fullname
*/}}
{{- define "thanos.ruler.fullname" -}}
{{ include "shared.fullname" . }}-ruler
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.ruler.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.ruler.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.ruler.serviceAccountName" -}}
{{- if .Values.ruler.serviceAccount.create -}}
{{- default (printf "%s-ruler" (include "shared.fullname" .)) .Values.ruler.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.ruler.serviceAccount.name }}
{{- end -}}
{{- end -}}
