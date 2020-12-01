#!bin/bash

cnt="3"  # used for file tags
pcap_dir="pcaps_dns_complete/qry-a-shadowserver.org-v${cnt}"
json_file="json_dns_complete/zmap_dns_complete_1606753012_third_complete_scan.log"

# read all ips from the pcap
for pcap in $(realpath "${pcap_dir}/"*".pcap")
do
    ./tshark_sanitize_ip_src.sh $pcap
done | sort | uniq | gzip > "pcap_sources_s${cnt}.txt.gz"

# read all ips from the zmap json
cat $json_file | jq ."saddr" | sed -e 's/^"//' -e 's/"$//' |\
    sort | uniq | gzip > "json_sources_s${cnt}.txt.gz"

# find common sources
comm -12 <(zcat pcap_sources_s${cnt}.txt.gz) <(zcat json_sources_s${cnt}.txt.gz) |\
    sort | gzip > "amp_src_s${cnt}.txt.gz"
