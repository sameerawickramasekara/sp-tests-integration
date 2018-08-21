#This is a runscenario.sh that will only execute the patterns
#for default infras
#TODO need to improve to create the docker file and change the infras.

DIR=$2
FILE1=${DIR}/infrastructure.properties
FILE2=${DIR}/testplan-props.properties
k8s_properties=${DIR}/k8s.properties

cat $k8s_properties

PRODUCT_GIT_URL=$(grep "PRODUCT_GIT_URL" $FILE2 | awk -F= '{print $2}' | sed 's/\\//g')
PRODUCT_GIT_BRANCH=$(grep "PRODUCT_GIT_BRANCH" $FILE2 | awk -F= '{print $2}' | sed 's/\\//g')
KUBERNETES_MASTER=$(grep "PRODUCT_GIT_BRANCH" $FILE2 | awk -F= '{print $2}' | sed 's/\\//g')

echo $KUBECONFIG

mkdir $DIR/product-sp
git clone $PRODUCT_GIT_URL $DIR/product-sp >&1

#update the kubernetes_master
cat $k8s_properties > ${DIR}/product-sp/modules/integration/tests-kubernetes-integration/src/test/resources/infrastructure-automation/k8s.properties
cd ${DIR}/product-sp/modules/integration/tests-kubernetes-integration
pwd
mvn clean install >&1

