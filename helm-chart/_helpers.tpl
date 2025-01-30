{{/*
Expand the name of the chart.
*/}}
{{- define "my-chart.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{/*
Create a fullname for the chart (release-name + chart name).
*/}}
{{- define "my-chart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}
