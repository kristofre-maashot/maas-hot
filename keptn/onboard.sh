keptn auth --endpoint=https://api.keptn.$(kubectl get cm -n keptn keptn-domain -ojsonpath={.data.app_domain}) --api-token=$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)

DT_TENANT=gcp25389.sprint.dynatracelabs.com
DT_API_TOKEN=s_8U6A8XSjCqtdDbEZ9rk
DT_PAAS_TOKEN=d_qYgDEbRh6L8gOTE01_G

kubectl -n keptn create secret generic dynatrace --from-literal="DT_TENANT=gcp25389.sprint.dynatracelabs.com" --from-literal="DT_API_TOKEN=s_8U6A8XSjCqtdDbEZ9rk"  --from-literal="DT_PAAS_TOKEN=d_qYgDEbRh6L8gOTE01_G"
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-service/0.7.0/deploy/manifests/dynatrace-service/dynatrace-service.yaml
kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-sli-service/0.4.0/deploy/service.yaml
keptn configure monitoring dynatrace --suppress-websocket
#keptn configure monitoring dynatrace --project=simplenodeproject --suppress-websocket