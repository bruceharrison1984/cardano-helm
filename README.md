# Cardano Helm Charts
These charts will deploy a Cardano cluster with one block-producer, and 3 relay nodes

## Prerequisites
- Helm 3
- kubectl
- minikube if running locally

## Usage
- Place your kes.skey, vrf.key, and node.cert files in to the ./keys directory, and then run `helm install cardano . --value Values.yaml`
- This will deploy the cluster, using the supplied keys for the block-producer
    - The keys must be copied from the `secrets` volume in to another volume because Cardano requires the files to have RW permissions, and k8s only allow RO permissions on secret volumes. [github issue](https://github.com/kubernetes/kubernetes/issues/62099)