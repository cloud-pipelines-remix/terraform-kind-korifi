# resource "kubernetes_config_map" "example" {
#   metadata {
#     name = "cloudflared"
#   }
#
#   data = {
#     config.yaml  = yamlencode({"runnel":cloudflare_tunnel.example.name, "credentials-file": "/etc/cloudflared/creds/credentials.json", "metrics": "0.0.0.0:2000", "no-autoupdate": true, "ingress":[{"hostname": "concourse.dashaun.live","service": "http://kourier-internal.knative-serving.svc.cluster.local:80",}]})
#   }
#
# }