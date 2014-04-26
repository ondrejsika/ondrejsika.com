---
layout: post
title: PDF files now opened by Gimp by default in Debian
categories: blog

lang: EN
meta_keywords: pdf, gimp, debian
---

Debin bug <https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=522998>

#### My solution

Remove from end of file in section MimeType `application/pdf`

``` bash
root@debian:~# vim /usr/share/applications/gimp.desktop
```

and update desktop database

``` bash
root@debian:~# update-desktop-database
```

Thats all :)
