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





############################################################
kubectl describe cm redis-conf
kubectl create -f headless-service.yml
kubectl get pods -o wide
kubectl get pv
kubectl run -it ubuntu --image=ubuntu --restart=Never /bin/bash
apt-get update
apt-get install -y vim wget python2.7 python-pip redis-tools dnsutils
pip install redis-trib==0.5.1
redis-trib.py replicate \
  --master-addr `dig +short redis-app-0.redis-service.default.svc.cluster.local`:6379 \
  --slave-addr `dig +short redis-app-3.redis-service.default.svc.cluster.local`:6379

redis-trib.py replicate \
  --master-addr `dig +short redis-app-1.redis-service.default.svc.cluster.local`:6379 \
  --slave-addr `dig +short redis-app-4.redis-service.default.svc.cluster.local`:6379

redis-trib.py replicate \
  --master-addr `dig +short redis-app-2.redis-service.default.svc.cluster.local`:6379 \
  --slave-addr `dig +short redis-app-5.redis-service.default.svc.cluster.local`:6379
kubectl get svc redis-access-service -o wide

