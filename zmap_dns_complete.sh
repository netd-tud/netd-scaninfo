#!/bin/bash

# config
zmap="/home/skyo/Repositories/zmap/sbin/zmap"
request="A,google.com"
logfile="zmap_dns_complete.log"
interface="eno1"
node_ip="141.22.28.227"

# run zmap
$zmap \
    --interface="$interface" \
    --source-ip="$node_ip" \
    --target-port=53 \
    --probe-module=dns \
    --probe-args="$request" \
    --seed=13371337 \
    --blocklist-file=/etc/zmap/blocklist.conf \
    --rate=25000 \
    -O json -o $logfile
