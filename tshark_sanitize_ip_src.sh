#!/bin/bash

domain="dnsscan.shadowserver.org"
ip="184.105.143.133"
dns_sanitize="ip and not icmp and udp and udp.srcport==53 and dns"
dns_sanitize+=" and dns.qry.name==${domain} and dns.flags.response==1"
dns_sanitize+=" and dns.flags.rcode==0 and dns.flags.recavail==1"
dns_sanitize+=" and dns.a==${ip}"

tshark -nr $1 -Y "$dns_sanitize" -T fields -e ip.src
