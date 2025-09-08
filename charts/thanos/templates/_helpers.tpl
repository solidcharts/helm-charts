{{/*
The Thanos image to use
*/}}
{{- define "thanos.image" -}}
{{- $separator := ":" -}}
{{- $tag := printf "%s" (default (printf "v%s" .Chart.AppVersion) .Values.image.tag) }}
{{- $version := $tag }}
{{- $digest := ternary (printf "%s" .Values.image.digest) "" (not (empty .Values.image.digest)) }}
{{- if not (empty $digest) }}
    {{- $separator = "@" -}}
    {{- $version = $digest }}
{{- end -}}
{{- printf "%s%s%s" .Values.image.repository $separator $version }}
{{- end }}

{{/*
Objstore secret name
*/}}
{{- define "thanos.objstoreConfigSecretName" -}}
{{- if .Values.objstoreConfig.create -}}
{{- default (printf "%s-objstore-config" (include "shared.fullname" .)) .Values.objstoreConfig.name }}
{{- else -}}
{{- .Values.objstoreConfig.name }}
{{- end -}}
{{- end -}}
