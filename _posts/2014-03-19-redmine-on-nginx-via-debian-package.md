---
layout: post
title: Redmine on Nginx via DEB package
categories: blog

lang: EN
meta_keywords: python, unique array, reduce
---

In Januar I wrote article how [Install Redmine on Debian with Nginx](/blog/2014/01/04/redmine-installation-on-debian-with-nginx.html).

Now, i wrote Debian package for easier installation.

## Download & install

``` bash
wget http://drive.ondrejsika.com/debian/all/nginx-redmine-2.3-sqlite.deb
dpkg -i nginx-redmine-2.3-sqlite.deb
```

## Use repository

``` bash
echo "deb http://drive.ondrejsika.com/debian all/" >> /etc/apt/source.list
apt-get update

apt-get install nginx-redmine-2.3-sqlite
```
