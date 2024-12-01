#!/bin/bash
git clone https://github.com/felipevicens/pacman-k8s-demo/
cd pacman-k8s-demo
microk8s.kubectl create -f .
