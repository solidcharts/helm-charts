{{/*
Name of the component
*/}}
{{- define "thanos.compactor.name" -}}
{{- default "compactor" .Values.compactor.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.compactor.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.compactor.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.compactor.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.compactor.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.compactor.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.compactor.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.compactor.serviceAccountName" -}}
{{- if .Values.compactor.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.compactor.name" .)) .Values.compactor.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.compactor.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Fullname
*/}}
{{- define "thanos.compactor.serviceName" -}}
{{ printf "%s-headless" (include "thanos.compactor.fullname" .) }}
{{- end }}
