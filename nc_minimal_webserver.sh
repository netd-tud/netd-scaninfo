#!/bin/bash

# based on:
#   https://stackoverflow.com/a/16640233
#   https://en.wikipedia.org/wiki/HTTP_303#Example

server_port="80"
http_url="https://ilab-scans.realmv6.org/"
http_redirect="HTTP/1.1 303 See Other\r\nLocation: $http_url"

while true; do
    echo -e "$http_redirect" | nc -l -p "$server_port" -q 1
done
