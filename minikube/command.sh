#!/bin/bash

echo "########################"
echo "dockerインストール"
echo "########################"
# パッケージデータベースを更新
sudo apt update
# dockerに必要なパッケージをインストール
sudo apt -y install apt-transport-https ca-certificates software-properties-common
# dockerリポジトリを追加する
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# dockerレポジトリをaptに追加する
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# パッケージデータベースを更新
sudo apt update
# dockerリポジトリが適用されたことを確認
sudo apt-cache policy docker-ce
# dockerをインストールする
sudo apt install -y docker-ce
# docker グループ作成（すでに作成済み）
sudo groupadd docker
# ユーザをdockerグループに追加
sudo usermod -aG docker vagrant && newgrp docker
# dockerの再起動
sudo systemctl restart docker

echo "########################"
echo "kubectlインストール"
echo "########################"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

echo "########################"
echo "minikubeインストール"
echo "########################"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
rm -f minikube_latest_amd64.deb


