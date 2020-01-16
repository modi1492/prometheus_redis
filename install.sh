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