{{/*
Thanos image to use
*/}}
{{- define "thanos.image" -}}
{{- include "shared.image" (dict "chart" .Chart "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
The config reloader image to use
*/}}
{{- define "thanos.configReloaderImage" -}}
{{- $separator := ":" -}}
{{- $tag := printf "%s" .Values.ruler.configReloader.image.tag }}
{{- $version := $tag }}
{{- $digest := ternary (printf "%s" .Values.ruler.configReloader.image.digest) "" (not (empty .Values.ruler.configReloader.image.digest)) }}
{{- if not (empty $digest) }}
    {{- $separator = "@" -}}
    {{- $version = $digest }}
{{- end -}}
{{- printf "%s%s%s" .Values.ruler.configReloader.image.repository $separator $version }}
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
{{- or (and .Values.queryFrontend.enabled .Values.queryFrontend.ingress.enabled) (and .Values.query.enabled .Values.query.ingress.enabled) -}}
{{- end -}}

{{/*
Check if we have required ingress parameters are set
Usage: {{- include "thanos.ingress.checkParams" (dict "componentPath" "queryFrontend" "ingress" .Values.component.ingress) }}
*/}}
{{- define "thanos.ingress.checkParams" -}}
    {{- if and .ingress.enabled -}}
    {{- if not .ingress.hosts -}}
      {{- fail (printf "At least one ingress host must be provided in .Values.%s.ingress.hosts" .componentPath) -}}
    {{- end -}}
    {{- if not (first .ingress.hosts).paths -}}
      {{- fail (printf "At least one path element must be provided in .Values.%s.ingress.hosts.paths" .componentPath) -}}
    {{- end -}}
    {{- end -}}
{{- end -}}

{{/* Get the query ingress url */}}
{{- define "thanos.queryIngress.url" -}}
  {{- if and .Values.queryFrontend.enabled .Values.queryFrontend.ingress.enabled -}}
    {{- include "thanos.ingress.checkParams" (dict "componentPath" "queryFrontend" "ingress" .Values.queryFrontend.ingress) }}
    {{- if .Values.queryFrontend.ingress.tls -}}
      {{- printf "https://%s%s" (first (first .Values.queryFrontend.ingress.tls).hosts) (first (first .Values.queryFrontend.ingress.hosts).paths).path -}}
    {{- else -}}
      {{- printf "http://%s%s" (first .Values.queryFrontend.ingress.hosts).host (first (first .Values.queryFrontend.ingress.hosts).paths).path -}}
    {{- end -}}
  {{- else if and .Values.query.enabled .Values.query.ingress.enabled -}}
    {{- include "thanos.ingress.checkParams" (dict "componentPath" "query" "ingress" .Values.query.ingress) }}
    {{- if .Values.query.ingress.tls -}}
      {{- printf "https://%s%s" (first (first .Values.query.ingress.tls).hosts) (first (first .Values.query.ingress.hosts).paths).path -}}
    {{- else -}}
      {{- printf "http://%s%s" (first .Values.query.ingress.hosts).host (first (first .Values.query.ingress.hosts).paths).path -}}
    {{- end -}}
  {{- else -}}
    {{- print "" -}}
  {{- end -}}
{{- end -}}
