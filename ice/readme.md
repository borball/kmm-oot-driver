# How to use

```shell
oc apply -k .
``` 

Create secret:

```shell
sed "s|PULL_SECRET|$(cat ~/root/pull-secret.json|base64)|" pull-secret.yaml |oc apply -f
```