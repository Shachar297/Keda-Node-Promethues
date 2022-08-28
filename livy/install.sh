helm repo add jahstreet https://jahstreet.github.io/helm-charts
helm repo update
kubectl create namespace livy

helm upgrade --install livy --namespace livy jahstreet/livy \
    --set rbac.create=false 
    # If you are running RBAC-enabled Kubernetes cluster
kubectl get pods --namespace livy -w
# Wait until Pod `livy-0` moves to Running state