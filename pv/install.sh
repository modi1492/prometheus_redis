kubectl create -f namespace.yaml
kubectl create -f claim.yaml -n cmengdi
kubectl get pvc -n cmengdi
kubectl create -f http-server-pod.yaml -n cmengdi




kubectl delete -f namespace.yaml
kubectl delete -f claim.yaml -n cmengdi
kubectl delete -f http-server-pod.yaml -n cmengdi
