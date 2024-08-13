# Use KMM operator to build and install OOT(Out-Of-Tree) driver

Install operator:

```shell
oc apply -f operator.yaml
```

Create a pull secret which will be used to pull/push the OOT driver image.

```shell
oc create -n openshift-kmm secret docker-registry <pull_secret_name> 
  --docker-server=<registry_server> 
  --docker-username=<user_name> 
  --docker-password=<password> 
  --docker-email=<email>
```

Create a CM which contains the Dockerfile to build the driver image from source code 1.12.18. 

```shell
oc apply -f containerfile-cm-1.12.18.yaml
```

Another version from 1.14.13:

```shell
oc apply -f containerfile-cm-1.14.13.yaml
```

Create a Module to build the OOT driver image for version 1.12.18.

```shell
oc apply -f module-build-1.12.18.yaml
```

Another module for version 1.14.13:

```shell
oc apply -f module-build-1.14.13.yaml
```
There will be a pod created to build the image. 

Create a MC to load the OOT driver after node is rebooted:

```shell
cd ../mc
./create-mc-ice-1.12.18.sh
```

or another version:
```shell
cd ../mc
./create-mc-ice-1.14.13.sh
```

The node will be rebooted twice and OOT driver will be loaded. 