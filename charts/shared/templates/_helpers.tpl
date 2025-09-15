{{/*
Expand the name of the chart.
*/}}
{{- define "shared.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "shared.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "shared.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "shared.labels" -}}
helm.sh/chart: {{ include "shared.chart" . }}
{{ include "shared.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "shared.selectorLabels" -}}
app.kubernetes.io/name: {{ include "shared.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Image to use. Allow overrides with global valus image registry.
Usage: {{- include "shared.image" (dict "chart" .Chart "image" .Values.image "global" .Values.global) | nindent 8 }}
*/}}
{{- define "shared.image" -}}
{{- $registryName := .image.registry -}}
{{- if .global }}
    {{- if .global.imageRegistry }}
        {{- $registryName = .global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- $repositoryName := .image.repository -}}
{{- $separator := ":" -}}
{{- $versionMarker := printf "%s" (default (printf "%s" .chart.AppVersion) .image.tag) }}
{{- $digest := ternary (printf "%s" .image.digest) "" (not (empty .image.digest)) }}
{{- if not (empty $digest) }}
    {{- $separator = "@" -}}
    {{- $versionMarker = $digest }}
{{- end -}}
{{- if $registryName }}
{{- printf "%s/%s%s%s" $registryName $repositoryName $separator $versionMarker -}}
{{- else -}}
{{- printf "%s%s%s" $repositoryName $separator $versionMarker -}}
{{- end -}}
{{- end }}
