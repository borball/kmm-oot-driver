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

Create a Module to build the OOT driver image.

```shell
oc apply -f module-build.yaml
```

Once the driver image is built successfully, the image will be pushed to the repo defined in module-build.yaml.

Next step create a Module on the cluster(KMM shall be installed) where needs the OOT driver so that KMM operator 
will unload the in-tree driver and install the OOT driver. 

```shell
oc apply -f module-install.yaml
```


