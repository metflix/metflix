#!/bin/sh

. scripts/common.sh

echo "Restart applications"

for d in $dir;do
    if [ "hystrix-dashboard" == "$d" ]; then
        # skip hystrix-dashboard to reduce memory
        continue
    fi
    app=$d-$suffix
    echo "++++ Restart $app ++++"
    pushd $d
        cf restart $app
    popd
done

cf apps