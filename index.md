# Test
## Internet-wide Scans for a Better Internet Welcome to GitHub Pages

You have probably contacted our scanning node because you see incoming scan traffic into your network. You do not need to worry, we are a research team focussing on improving the Internet security. Currently, we are monitoring the landscape of amplification attacks.

You can use the [editor on GitHub](https://github.com/MarcinNaw/scans-haw/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

# DNS Scans

You have probably contacted our scanning node because you see incoming DNS scan traffic into your network. You do not need to worry, we are a research team focussing on DNS security.

## Counter-Measures

You do not want to be scanned? Read on.

### Your Blacklists

Our DNS scans have a fairly simple signature:

  1.  We use the default Zmap IP.ID (54321).
  2.  We initiate scans with the max TTL (255).
  3.  DNS Scan originate from a single IP address (141.22.28.227).
  
 We recommend configuring firewall rules for 1.+2. in your network. This way you will drop traffic from any other unwanted Zmap scan.

### Our Blacklists

Of course, we can also exclude your network from our scans. This way nothing will arrive at your edge. We just need your prefix.

## Contact

DNS research is conducted by [Marcin Nawrocki](https://www.mi.fu-berlin.de/en/inf/groups/ilab/members/nawrocki.html). One email ist enough!

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/MarcinNaw/scans-haw/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
