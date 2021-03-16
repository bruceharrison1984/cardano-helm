**This is still very experimental, use at your own risk!**

# Cardano Helm Charts
These charts will deploy a Cardano cluster with one block-producer, and 3 relay nodes.

## Prerequisites
- Helm 3
- kubectl
- minikube if running locally

## Usage (minikube)
- Copy all keys in to `./keys` in the root of this project
- Run the following from the root of this project:
```sh
minikube start
helm install cardano . --values Values.yaml --namespace cardano --create-namespace
minikube dashboard
```
You should see all nodes eventually turn green, meaning the cluster is up and health.

**Failure to supply keys will result in the block-producer failing to start.**

## Useful commands
Logs can be accessed in the standard kubectl fashion:
```sh
kubectl get pods
kubectl logs --namespace cardano <pod-name> -f 
```

gLiveView can be accessed as follows:
```sh
kubectl get pods
kubectl exec -it --namespace cardano <pod-name> -- gLiveView
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

## Storage
All nodes make use of data volumes on `/opt/cardano/data` to prevent the nodes from having to fully sync again if they go offline

## Container
The container used here is [nessusio/cardano](https://hub.docker.com/r/nessusio/cardano).

[The creator runs his own pool (ASTOR), so please check it out.](http://astorpool.net/)

## Contribute
PRs are very welcome, as well as ADA donations:
- addr1qx2t4hr27795vwfpqffca6dzt9kfw77h362f0un0h2m8rsn0k2ukr28kxc4fzuxvrwf535zw78cc2p3er9hlnled9nsqhqc9uz