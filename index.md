---
layout: home 
title:  "Home"
---

## Internet-wide Scans for a Better Internet

You have probably found our scanning node because you see incoming scan traffic reaching your network. You do not need to worry, we are a research team focusing on improving the Internet security. Currently, we are monitoring the landscape of amplification attacks.

### Current Scan Types

Scan Type | Description | Frequency
------------ | ------------- | -----------
DNS Scan (complete) | Complete IPv4 address space scan which finds recursive DNS resolvers | Rare
DNS Scan (limited) | Targeted scan towards recursive DNS resolvers only | Occasional


## Countermeasures

You do not want to be scanned? Read on.

### Your Blacklists

Our scans have fairly simple signatures:

  1.  We use the default zmap IP.ID: `54321`
  2.  We initiate scans with the maximum IP.TTL: `255`
  3.  Scans originate only from a single IP source address: `141.22.28.227`

We recommend adding firewall rules for signature `1` and `2`. This way you will drop traffic from any unwanted zmap scan.

### Our Blacklists

Of course, we can also exclude your network from our scans. This way nothing will arrive at your edge. We just need your prefix.


## Contact

This is a mutual project between HAW Hamburg and Freie Universität Berlin. DNS research is conducted by [Marcin Nawrocki](https://www.nawrocki.berlin). An email is enough, we will sort it out.
