# ここを参考に再インストール
#https://qiita.com/yuichi1992_west/items/571016084c110d15320e
# minikube start
# -> これでDriverが自動的にdockerで起動する

#--------------以下は不要------------
# containerd
# https://kubernetes.io/ja/docs/setup/learning-environment/minikube/

#(1)
#minikube start \
#    --network-plugin=cni \
#    --enable-default-cni \
#    --container-runtime=containerd \
#    --bootstrapper=kubeadm

#(2)
#minikube start \
#    --network-plugin=cni \
#    --enable-default-cni \
#    --extra-config=kubelet.container-runtime=remote \
#    --extra-config=kubelet.container-runtime-endpoint=unix:///run/containerd/containerd.sock \
#    --extra-config=kubelet.image-service-endpoint=unix:///run/containerd/containerd.sock \
#    --bootstrapper=kubeadm

#(3)これでいけるっぽい
#minikube start --container-runtime=containerd

#(4)これもある
#minikube start --container-runtime=containerd --docker-opt containerd=/var/run/containerd/containerd.sock --network-plugin=cni

#(5)driver関連のエラーが出た場合 --driver=dockerで試す


