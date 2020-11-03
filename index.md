## Internet-wide Scans for a Better Internet

You have probably contacted our scanning node because you see incoming scan traffic into your network. You do not need to worry, we are a research team focussing on improving the Internet security. Currently, we are monitoring the landscape of amplification attacks.

### Current Scan Types

Scan Type | Description | Frequency
------------ | ------------- | -----------
DNS Scan (complete) | Complete IPv4 address space scan which finds recursive DNS resolvers | Rare
DNS Scan (limited) | Scan towards recursive DNS resolvers only | Occasional


## Counter-Measures

You do not want to be scanned? Read on.

### Your Blacklists

Our cans have fairly simple signatures:

  1.  We use the default zmap IP.ID: `54321`.
  2.  We initiate scans with the maximum IP.TTL: `255`.
  3.  Scans originate only from a single IP source address `141.22.28.227`.
  
We recommend adding firewall rules for signature `1.` and `2.` in your network. This way you will drop traffic from any other unwanted Zmap scan.

### Our Blacklists

Of course, we can also exclude your network from our scans. This way nothing will arrive at your edge. We just need your prefix.


## Contact

DNS research is conducted by [Marcin Nawrocki](https://www.nawrocki.berlin). An email is enough, we will sort it out.
