# pacman-k8s-demo

This is a simple pacman app that utilizes the default storage class for storing high score.

The demo uses a single node of microk8s. After installation, Pacman will be available in single node host IP, port 32001 (NodePort mode).

## Preparation
Install microk8s and add persistent storage

```
sudo snap install microk8s --classic --channel=1.27/stable
sudo usermod -a -G microk8s $USER
mkdir -p ~/.kube
chmod 0700 ~/.kube
newgrp microk8s
microk8s status --wait-ready
microk8s enable hostpath-storage
microk8s enable metrics-server
microk8s status --wait-ready
```
## Pacman 

Deploy Pacman

```
git clone https://github.com/felipevicens/pacman-k8s-demo/
cd pacman-k8s-demo
microk8s.kubectl create -f .
watch microk8s.kubectl -n pacman get all
```

Play pacman

```
IP=`curl ifconfig.me -s`
echo "The url is http://$IP:32001"
```

Uninstall

```
microk8s.kubectl delete -f .
```
