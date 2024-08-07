# How to use

```shell
oc apply -k .
``` 

Create secret:

```shell

oc create -n openshift-kmm secret docker-registry pull-secret --docker-server=quay.io --docker-username=<> --docker-password=<>
```