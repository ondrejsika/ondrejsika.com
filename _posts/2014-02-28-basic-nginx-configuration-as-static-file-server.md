---
layout: post
title: Basic NGINX configuration as static file server
categories: blog

lang: EN
meta_keywords: static file server, nginx
---

create file `/etc/nginx/sites-available/drive.ondrejsika.com`

```
server {
    listen 80;
    server_name drive.ondrejsika.com;
    autoindex on;
    index index.html;
    root /drive/;
}
```

create symbolic link to sites enabled

```
ln -s /etc/nginx/sites-available/drive.ondrejsika.com /etc/nginx/sites-available
```

and restart nginx

```
service nginx restart
```
