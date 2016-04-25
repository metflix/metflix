#!/bin/sh

. scripts/common.sh

echo "Delete apps"

current_apps=`cf apps`
for d in $dir;do
    app="$d-$suffix"
    check=`echo $current_apps | grep $app`
    if [ "$check" != "" ];then
        echo "++++ Delete $app ++++"
        cf delete -f $app
    fi
done

cf apps

echo "Delete services"

current_services=`cf services`
for s in $service;do
    check=`echo $current_services | grep $s`
    if [ "$check" != "" ];then
        echo "++++ Delete $s ++++"
        cf delete-service -f $s
    fi
done

cf services

cf delete-orphaned-routes -f