{{/*
Name of the component
*/}}
{{- define "thanos.ruler.name" -}}
{{- default "ruler" .Values.ruler.nameOverride -}}
{{- end }}

{{/*
Fullname
*/}}
{{- define "thanos.ruler.fullname" -}}
{{ include "shared.fullname" . }}-{{ include "thanos.ruler.name" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.ruler.labels" -}}
{{ include "shared.labels" . }}
app.kubernetes.io/component: {{ include "thanos.ruler.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.ruler.selectorLabels" -}}
{{ include "shared.selectorLabels" . }}
app.kubernetes.io/component: {{ include "thanos.ruler.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.ruler.serviceAccountName" -}}
{{- if .Values.ruler.serviceAccount.create -}}
{{- default (printf "%s-%s" (include "shared.fullname" .) (include "thanos.ruler.name" .)) .Values.ruler.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.ruler.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Rules configmap name
*/}}
{{- define "thanos.ruler.rulesConfigmapName" -}}
{{- if .Values.ruler.rules.create -}}
{{- default (printf "%s-rules" (include "thanos.ruler.fullname" .)) .Values.ruler.rules.name }}
{{- else -}}
{{- .Values.ruler.rules.name }}
{{- end -}}
{{- end -}}

{{/*
Alertmanagers secret name
*/}}
{{- define "thanos.ruler.alertmanagersConfigSecretName" -}}
{{- if .Values.ruler.alertmanagersConfig.create -}}
{{- default (printf "%s-alertmanagers-config" (include "thanos.ruler.fullname" .)) .Values.ruler.alertmanagersConfig.name }}
{{- else -}}
{{- .Values.ruler.alertmanagersConfig.name }}
{{- end -}}
{{- end -}}

{{/*
Fullname
*/}}
{{- define "thanos.ruler.serviceNameHeadless" -}}
{{ printf "%s-headless" (include "thanos.ruler.fullname" .) }}
{{- end }}
