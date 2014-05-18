---
layout: post
title: Nginx echo server - text response directly from Nginx
categories: blog

lang: EN
meta_keywords: nginx, echo serever, direct response
---

### Install echo module

We must install __HttpEchoModule__ <http://wiki.nginx.org/HttpEchoModule#Installation>.

This module is in debian packages `nginx-extras` or `nginx-full`.


### Server config

To sites-enabled add file with this content

``` nginx
server {
    listen 80;
    server_name server1.ondrejsika.com;
    location / {
        default_type 'text/plain';
        echo 'server1.ondrejsika.com 1.43.23.187';
    }
}
```

