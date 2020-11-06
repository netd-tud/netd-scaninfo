#!/bin/bash

# config:
#  rotate every 100MB, only record dns responses (and not ICMP backscatter)
source config_file
pcap_max_size="100000"

dir_pcaps="pcaps_dns_complete"
mkdir $dir_pcaps
name_pcaps="${dir_pcaps}/dns_complete_$(date +%s).pcap"
scan_filter="dst $node_ip and not icmp and udp src port 53"

# capture filter is only the first sanity check
dumpcap -Pi "$interface" \
    -f "$scan_filter" \
    -w "$name_pcaps" \
    -b filesize:"$pcap_max_size"
