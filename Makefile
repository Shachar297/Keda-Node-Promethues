build_node:
	./dockerLogin.sh
	docker build node/ -t promtest
	docker run --name promtest -p 5089:5089 promtest
	docker ps
	docker stop promtest

build_node_k8s:
	./dockerLogin.sh
	cd K8s
	kubectl kustomize . | kubectl apply -f -
	kubectl get po -A

install_livy:
	./livy/install.sh

install_keda:
	kubectl apply -f https://github.com/kedacore/keda/releases/download/v2.8.0/keda-2.8.0.yaml
	kubectl apply -f keda/scaler.yml

install_prometheus:	
	./promethues/install.sh


all: build_node build_node_k8s install_livy install_keda install_prometheus