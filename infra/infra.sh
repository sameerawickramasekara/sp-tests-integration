#This is a dummy infra.sh
#!bin/bash

kube_master=`echo $1 | awk -F= '{print $2}'`
output_dir=`echo $2 | awk -F= '{print $2}'`

echo $kube_master
echo $output_dir

echo "KUBERNETES_MASTER=$kube_master" > $output_dir/k8s.properties

