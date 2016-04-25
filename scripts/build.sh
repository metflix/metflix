#!/bin/sh

. scripts/common.sh

for d in $dir;do
    echo "++++ Build $d ++++"
    pushd $d
        ./mvnw clean package -Dmaven.test.skip=true
    popd
done