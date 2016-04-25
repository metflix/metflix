#!/bin/sh

suffix=tmaki
domain=cfapps.io

dir="$dir config-server"
dir="$dir eureka-server"
dir="$dir membership"
dir="$dir recommendations"
dir="$dir ui"
dir="$dir hystrix-dashboard"

service="$service config-server"
service="$service eureka-server"