#!/bin/bash

# config
source config_file

mode=$1
dir_json="json_dns_${mode}"
mkdir $dir_json
logfile="${dir_json}/zmap_dns_${mode}_$(date +%s).log"

## This module does minimal answer verification. It only verifies that the
## response roughly looks like a DNS response. It will not, for example,
## require the QR bit be set to 1. All such analysis should happen offline.
## Specifically, to be included in the output it requires:
## - That the response packet is >= the query packet.
## - That the ports match and the packet is complete.
## To be marked as success it also requires:
## - That the response bytes that should be the ID field matches the send bytes.
## - That the response bytes that should be question match send bytes.
## To be marked as app_success it also requires:
## - That the QR bit be 1 and rcode == 0.

# run zmap
if [[ "$mode" == "complete" ]]; then
    zmap \
        --interface="$interface" \
        --source-ip="$node_ip" \
        --target-port=53 \
        --probe-module=dns \
        --probe-args="$dns_request_complete" \
        --seed=13371337 \
        --blocklist-file=/etc/zmap/blocklist.conf \
        --rate=25000 \
        -O json -o $logfile \
        --output-fields="saddr" \
        --output-filter="success = 1 && app_success = 1"

elif [[ "$mode" == "limited" ]]; then
    zmap \
        --target-port=53 \
        --probe-module=dns \
        --probe-args="$dns_request_limited" \
        --blocklist-file=/etc/zmap/blocklist.conf \
        --rate=25000 \
        -O json -o $logfile \
        --output-fields="saddr,success,app_success" \
        --allowlist-file=<(zcat amp_src.txt.gz | shuffle)

else
    echo "unknown scan mode"
    exit -1
fi
