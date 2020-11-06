#!/bin/bash

# config
source config_file
dir_json="json_dns_limited"
mkdir $dir_json
logfile="${dir_json}/zmap_dns_limited_$(date +%s).log"

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
    --target-port=53 \
    --probe-module=dns \
    --probe-args="$dns_request_limited" \
    --blocklist-file=/etc/zmap/blocklist.conf \
    --rate=25000 \
    -O json -o $logfile \
    --output-fields="saddr,success,app_success" \
    --allowlist-file=<(zcat amp_src.txt.gz | shuffle)
