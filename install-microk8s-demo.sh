sudo snap install microk8s --classic --channel=1.27/stable
sudo usermod -a -G microk8s $USER
mkdir -p ~/.kube
chmod 0700 ~/.kube
newgrp microk8s
microk8s status --wait-ready
microk8s enable hostpath-storage
microk8s enable metrics-server
microk8s status --wait-ready
