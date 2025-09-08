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

{{/*
Objstore config hash
*/}}
{{- define "thanos.objstoreConfigHash" -}}
{{- with .Values.objstoreConfig.value }}
{{- if kindIs "string" . }}
{{- sha256sum . }}
{{- else }}
{{- toYaml . | sha256sum }}
{{- end }}
{{- end }}
{{- end -}}

{{/* Check if we have query ingress */}}
{{- define "thanos.queryIngress.enabled" -}}
  {{- or (and .Values.queryFrontend.enabled .Values.queryFrontend.ingress.enabled) (.Values.query.enabled .Values.query.ingress.enabled) -}}
{{- end -}}

{{/* Get the query ingress url */}}
{{- define "thanos.queryIngress.url" -}}
  {{- if and .Values.queryFrontend.enabled .Values.queryFrontend.ingress.enabled -}}
    {{- if .Values.queryFrontend.ingress.tls -}}
      {{- printf "https://%s%s" (first (first .Values.queryFrontend.ingress.tls).hosts) .Values.queryFrontend.ingress.path -}}
    {{- else -}}
      {{- printf "http://%s%s" (first .Values.queryFrontend.ingress.hosts) .Values.queryFrontend.ingress.path -}}
    {{- end -}}
  {{- else if and .Values.query.enabled .Values.query.ingress.enabled -}}
    {{- if .Values.query.ingress.tls -}}
      {{- printf "https://%s%s" (first (first .Values.query.ingress.tls).hosts) .Values.query.ingress.path -}}
    {{- else -}}
      {{- printf "http://%s%s" (first .Values.query.ingress.hosts) .Values.query.ingress.path -}}
    {{- end -}}
  {{- else -}}
    {{- print "" -}}
  {{- end -}}
{{- end -}}