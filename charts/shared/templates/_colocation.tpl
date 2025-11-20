{{/*
Generate unified nodeSelector configuration.
Individual component settings override common settings.
Missing field = use commons, present field (even if empty) = use component value.
Usage: {{- include "shared.nodeSelector" (dict "component" .Values.bucketweb "commons" .Values.commons) | nindent 8 }}
*/}}
{{- define "shared.nodeSelector" -}}
{{- if hasKey .component "nodeSelector" -}}
{{- if .component.nodeSelector -}}
{{- toYaml .component.nodeSelector -}}
{{- end -}}
{{- else -}}
{{- $commonsNodeSelector := .commons.nodeSelector | default dict -}}
{{- if $commonsNodeSelector -}}
{{- toYaml $commonsNodeSelector -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/*
Generate unified affinity configuration.
Individual component settings override common settings.
Missing field = use commons, present field (even if empty) = use component value.
Usage: {{- include "shared.affinity" (dict "component" .Values.bucketweb "commons" .Values.commons) | nindent 8 }}
*/}}
{{- define "shared.affinity" -}}
{{- if hasKey .component "affinity" -}}
{{- if .component.affinity -}}
{{- toYaml .component.affinity -}}
{{- end -}}
{{- else -}}
{{- $commonsAffinity := .commons.affinity | default dict -}}
{{- if $commonsAffinity -}}
{{- toYaml $commonsAffinity -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/*
Generate unified topologySpreadConstraints configuration.
Individual component settings override common settings.
Missing field = use commons, present field (even if empty) = use component value.
Usage: {{- include "shared.topologySpreadConstraints" (dict "component" .Values.bucketweb "commons" .Values.commons) | nindent 8 }}
*/}}
{{- define "shared.topologySpreadConstraints" -}}
{{- if hasKey .component "topologySpreadConstraints" -}}
{{- if .component.topologySpreadConstraints -}}
{{- toYaml .component.topologySpreadConstraints -}}
{{- end -}}
{{- else -}}
{{- $commonsTSC := .commons.topologySpreadConstraints | default list -}}
{{- if $commonsTSC -}}
{{- toYaml $commonsTSC -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/*
Generate unified tolerations configuration.
Individual component settings override common settings.
Missing field = use commons, present field (even if empty) = use component value.
Usage: {{- include "shared.tolerations" (dict "component" .Values.bucketweb "commons" .Values.commons) | nindent 8 }}
*/}}
{{- define "shared.tolerations" -}}
{{- if hasKey .component "tolerations" -}}
{{- if .component.tolerations -}}
{{- toYaml .component.tolerations -}}
{{- end -}}
{{- else -}}
{{- $commonsTolerations := .commons.tolerations | default list -}}
{{- if $commonsTolerations -}}
{{- toYaml $commonsTolerations -}}
{{- end -}}
{{- end -}}
{{- end }}
