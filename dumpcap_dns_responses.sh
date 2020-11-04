#!/bin/bash

# config:
#  rotate every 100MB, only record dns responses (and not ICMP backscatter)
interface="eno1"
node_ip="141.22.28.227"
pcap_max_size="100000"

# debug
interface="wlp4s0"
node_ip="87.77.161.135"
pcap_max_size="10"

dir_pcaps="pcaps_dns_complete"
mkdir $dir_pcaps
name_pcaps="${dir_pcaps}/dns_complete.pcap"
scan_filter="dst $node_ip and not icmp and udp src port 53"

sudo dumpcap -Pi "$interface" \
    -f "$scan_filter" \
    -w "$name_pcaps" \
    -b filesize:"$pcap_max_size"
