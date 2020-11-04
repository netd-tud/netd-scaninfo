#!/bin/bash

dns_sanitize="ip and not icmp and udp and udp.srcport==53 and dns"
dns_sanitize+=" and dns.flags.response==1 and dns.qry.name==google.com"
dns_sanitize+=" and dns.flags.rcode==0 and dns.flags.recavail==1"

tshark -nr $1 -Y "$dns_sanitize" -T fields -e ip.src
