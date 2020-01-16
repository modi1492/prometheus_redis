kubectl create -f namespace.yaml
kubectl create -f claim.yaml -n cmengdi
kubectl get pvc -n cmengdi
kubectl create -f http-server-pod.yaml -n cmengdi
