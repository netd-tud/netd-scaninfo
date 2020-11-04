#!/bin/bash

# config
interface="eno1"
time_rot="300"

# rotate every 5 minutes, only record dns responses (and not ICMP backscatter)

sudo tshark -ni any -T fields -e "ip.src" -e "udp.srcport" -e "ip.dst" -e "udp.dstport" -e "ip.id" -e "dns.id" -e "dns.qry.name" -e "dns.flags" -e "dns.resp.ttl" -Y "dns and dns.qry.name==google.com"
