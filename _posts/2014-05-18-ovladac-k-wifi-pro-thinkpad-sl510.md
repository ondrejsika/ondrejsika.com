---
layout: post
title: Ovladač k wifi pro Thinkpad SL510
categories: blog

lang: CZ
meta_keywords: wifi, wifi driver, sl510
---

Ovladače jsou v balíku `firmware-realtek`, v repozitáři `no-nfree`.

``` bash
echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" >> /etc/apt/sources.list
apt-get update
apt-get install firmware-realtek
```

Více informací na <https://wiki.debian.org/rtl819x>.

