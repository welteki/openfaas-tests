#!/usr/bin/env bash

script_dir="$(dirname "$(readlink -f "$0")")"
N=$1

echo Attempting scale up event ${N} times...

for ((i=1; i<=$N; i++ ));
do
 sudo ctr -n openfaas-fn task rm figlet -f > /dev/null 2>&1
 sleep 1
 k6 run -q ${script_dir}/script.js -o output-prometheus-remote
done
