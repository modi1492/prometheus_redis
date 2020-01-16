helm install stable/nginx-ingress \
-n nginx-ingress \
--namespace kube-system  \
-f ingress-nginx.yaml  \
--kube-context k8s-decc-dev


helm install stable/nginx-ingress \
-n nginx-ingress \
--namespace kube-system  \
-f ingress-nginx.yaml  \
--set controller.service.externalIPs[0]=10.161.23.126  \
--kube-context k8s-decc-dev


helm del --purge nginx-ingress --kube-context k8s-decc-dev


kubectl get po,svc -n kube-system -o wide

helm ls --all nginx-ingress --kube-context k8s-decc-dev

curl http://10.161.23.126
curl -I http://10.161.23.126/healthz/

curl -kI  https://k8s.hongda.com/



###########################################################
kubectl apply -f namespace.yaml --kube-context k8s-decc-dev
kubectl create configmap qa-ibaboss-elk-redis-conf --from-file=redis.conf -n qa-ibaboss-elk --kube-context k8s-decc-dev
kubectl apply -f qa_ibaboss_elk_redis.yaml --kube-context k8s-decc-dev
kubectl get pods -n qa-ibaboss-elk --kube-context k8s-decc-dev
kubectl run busybox --image=busybox -n qa-ibaboss-elk --command -- ping baidu.com --kube-context k8s-decc-dev

