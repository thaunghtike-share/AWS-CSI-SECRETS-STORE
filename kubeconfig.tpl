apiVersion: v1
preferences: {}
kind: Config

clusters:
- cluster:
    server: ${endpoint}
    certificate-authority-data: ${cluster_auth_base64}
  name: this

contexts:
- context:
    cluster: this
    user: this
  name: this

current-context: this

users:
- name: this
  user:
    token: ${user_token}