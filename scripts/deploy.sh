#!/bin/sh

. scripts/common.sh

echo "Create missing services"

current_services=`cf services`
for s in $service;do
    check=`echo $current_services | grep $s`
    if [ "$check" == "" ];then
        echo "++++ Create $s ++++"
        credentials='{"uri":"http://'$s-$suffix.$domain'"}'
        cf create-user-provided-service $s -p $credentials
    fi
done

cf services

echo "Deploy applications"

for d in $dir;do
    if [ "hystrix-dashboard" == "$d" ]; then
        # skip hystrix-dashboard to reduce memory
        continue
    fi
    app=$d-$suffix
    echo "++++ Deploy $app ++++"
    pushd $d
        cf push $app
    popd
done

cf apps