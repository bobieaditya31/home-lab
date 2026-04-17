kubectl patch deployment ingress-nginx-controller -n ingress-nginx \
  --type='merge' \
  -p '{
    "spec": {
      "template": {
        "spec": {
          "nodeSelector": {
            "kubernetes.io/hostname": "homelab-control-plane"
          },
          "tolerations": [
            {
              "key": "node-role.kubernetes.io/control-plane",
              "operator": "Exists",
              "effect": "NoSchedule"
            }
          ]
        }
      }
    }
  }'