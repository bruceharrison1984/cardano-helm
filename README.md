# Cardano Helm Charts
These charts will deploy a Cardano cluster with one block-producer, and 3 relay nodes

## Prerequisites
- Helm 3
- kubectl
- minikube if running locally

## Usage (minikube)
- Copy all keys in to `./keys` in the root of this project
- Run the following from the root of this project:
```sh
minikube start
helm install cardano . --values Values.yaml
minikube dashboard
```
You should see all nodes eventually turn green, meaning the cluster is up and health.

## Logs
Logs can be accessed in the standard kubectl fashion:
```sh
kubectl get pods
kubectl logs <pod-name> -f
```

## Keys
- Place the following in to a `keys` directory in the root of this project before installing the helm charts:
    - kes.skey
    - vrf.key 
    - node.cert
- This will deploy the cluster, using the supplied keys for the block-producer
    - Keys are not exposed to anything except for the K8s cluster
    - Due to how K8s handles secrets, the keys are copied from one volume in to another.
        - The keys must be copied from the `secrets` volume in to another volume because Cardano requires the files to have RW permissions, and k8s only allow RO permissions on secret volumes. [github issue](https://github.com/kubernetes/kubernetes/issues/62099)