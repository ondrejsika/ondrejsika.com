---
layout: post
title: Ovladač k wifi pro Thinkpad X1
categories: blog

lang: CZ
meta_keywords: wifi, wifi driver, x1
---

Ovladače jsou v balíku `firmware-iwlwifi`, v repozitáři `no-nfree`.

``` bash
echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" >> /etc/apt/sources.list
apt-get update
apt-get install firmware-iwlwifi
```

Více informací na <https://packages.debian.org/wheezy/firmware-iwlwifi>.

