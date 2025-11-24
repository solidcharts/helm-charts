{{/*
Name of the component
*/}}
{{- define "thanos.bucketweb.name" -}}
{{- default "bucketweb" .Values.bucketweb.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.bucketweb.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.bucketweb.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.bucketweb.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.bucketweb.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.bucketweb.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.bucketweb.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.bucketweb.serviceAccountName" -}}
{{- if .Values.bucketweb.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.bucketweb.name" .)) .Values.bucketweb.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.bucketweb.serviceAccount.name }}
{{- end -}}
{{- end -}}
