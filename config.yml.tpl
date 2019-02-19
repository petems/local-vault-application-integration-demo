---
{{- with secret "secret/data/acmepassword" }}
password: "{{ .Data.data.value }}"
{{- end }}
