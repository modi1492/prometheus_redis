kubectl create -f namespace.yaml
kubectl create -f claim.yaml -n cmengdi1
kubectl get pvc -n cmengdi1
kubectl create -f http-server-pod.yaml -n cmengdi1




kubectl delete -f namespace.yaml
kubectl delete -f claim.yaml -n cmengdi1
kubectl delete -f http-server-pod.yaml -n cmengdi1
