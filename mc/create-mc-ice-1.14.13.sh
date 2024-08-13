export MODULE_NAME=ice
export MODULE_IMAGE_REPO=quay.io/bzhai/kmm-ice-driver-1.14.13
export SCRIPT_REPLACE_KERNEL_MODULE=$(cat replace-kernel-module.sh|base64 -w 0)
export SCRIPT_PULL_OOT_IMAGE=$(cat pull-image.sh|base64 -w 0)
export SCRIPT_WAIT_FOR_DISPATCHER=$(cat wait-for-dispatcher.sh|base64 -w 0)

mc_file="10-install-oot-$MODULE_NAME-mc.yaml"
cp 10-install-oot-mc.yaml $mc_file
sed -i "s|MODULE_NAME|${MODULE_NAME}|" $mc_file
sed -i "s|MODULE_IMAGE_REPO|${MODULE_IMAGE_REPO}|" $mc_file
sed -i "s|SCRIPT_REPLACE_KERNEL_MODULE|${SCRIPT_REPLACE_KERNEL_MODULE}|" $mc_file
sed -i "s|SCRIPT_PULL_OOT_IMAGE|${SCRIPT_PULL_OOT_IMAGE}|" $mc_file
sed -i "s|SCRIPT_WAIT_FOR_DISPATCHER|${SCRIPT_WAIT_FOR_DISPATCHER}|" $mc_file
