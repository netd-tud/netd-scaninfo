#!/bin/bash

# read all ips from the pcap
pcap_dir="pcaps_dns_complete"
for pcap in $(realpath "{pcap_dir}/*.pcap" | head -n 3)
do
    ./tshark_sanitize_ip_src.sh $pcap
done | sort | uniq | gzip > pcap_sources.txt.gz

# read all ips from the zmap json
json_file="json_dns_complete/zmap_dns_complete_1604505830.log"
cat $json_file | jq ."saddr" | sed -e 's/^"//' -e 's/"$//' |\
    sort | uniq | gzip > json_sources.txt.gz

# find common sources
comm -12 pcap_sources.txt.gz json_sources.txt.gz | sort | gzip > amp_src.txt.gz
