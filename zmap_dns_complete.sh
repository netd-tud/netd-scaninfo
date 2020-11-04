#!/bin/bash

# config
interface="eno1"
node_ip="141.22.28.227"
request="A,google.com"

dir_json="json_dns_complete"
mkdir $dir_json
logfile="${dir_json}/zmap_dns_complete_$(date +%s).log"

# run zmap
zmap \
    --interface="$interface" \
    --source-ip="$node_ip" \
    --target-port=53 \
    --probe-module=dns \
    --probe-args="$request" \
    --seed=13371337 \
    --blocklist-file=/etc/zmap/blocklist.conf \
    --rate=25000 \
    -O json -o $logfile \
    --output-fields="saddr,success,app_success" \
    --output-filter="success = 1 && app_success = 1"
