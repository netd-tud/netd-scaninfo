#!/bin/bash

# config
interface="eno1"
node_ip="141.22.28.227"
request="A,dnsscan.shadowserver.org"

dir_json="json_dns_complete"
mkdir $dir_json
logfile="${dir_json}/zmap_dns_complete_$(date +%s).log"

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
    --output-fields="saddr" \
    --output-filter="success = 1 && app_success = 1"
