#!/bin/bash

# config:
#  rotate every 100MB, only record dns responses (and not ICMP backscatter)
interface="eno1"
interface="wlp4s0"
pcap_max_size="100000"
pcap_max_size="10"
dir_pcaps="pcaps_dns_complete"
mkdir $dir_pcaps
name_pcaps="${dir_pcaps}/dns_complete.pcap"
node_ip="141.22.28.227"
scan_filter="dst $node_ip and not icmp and udp and dns"

sudo dumpcap -ni "$interface" \
    -b filesize:"$pcap_max_size" \
    -f "$scan_filter" \
    -w "$name_pcaps"
