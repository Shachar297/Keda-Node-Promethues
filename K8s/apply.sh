action=$1

if [[ $action == "d" ]]; then
    kubectl kustomize . | kubectl delete -f -
else
    kubectl kustomize . | kubectl apply -f -
fi

kubectl get po -A -w