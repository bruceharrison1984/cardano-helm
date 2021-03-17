{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cardano.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cardano.container" -}}
{{- printf "%s:%s" .Values.CardanoContainer .Chart.AppVersion }}
{{- end }}

{{/*
Relay labels
*/}}
{{- define "relay.labels" -}}
{{ include "relay.selectorLabels" . }}
{{ include "common.labels" . }}
{{- end }}

{{/*
Relay Selector labels
*/}}
{{- define "relay.selectorLabels" -}}
app.kubernetes.io/name: relay
{{- end }}

{{/*
Common labels
*/}}
{{- define "common.labels" -}}
helm.sh/chart: {{ include "cardano.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Block-Producer labels
*/}}
{{- define "block-producer.labels" -}}
{{ include "block-producer.selectorLabels" . }}
{{ include "common.labels" . }}
{{- end }}

{{/*
Block-Producer Selector labels
*/}}
{{- define "block-producer.selectorLabels" -}}
app.kubernetes.io/name: block-producer
{{- end }}