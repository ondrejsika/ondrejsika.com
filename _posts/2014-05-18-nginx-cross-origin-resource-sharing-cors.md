---
layout: post
title: Nginx cross origin resource sharing (CORS)
categories: blog

lang: EN
meta_keywords: nginx, cors, cross origini resource sharing, cross origin
---

Example of nginx server configuration with CORS.


``` nginx
server {
    listen 80;
    server_name cdn.ondrejsika.com

    if ($request_method = 'OPTIONS') {
        return 200;
    }

    add_header 'Access-Control-Allow-Origin' 'http://ondrejsika.com';
    add_header 'Access-Control-Allow-Credentials' 'true';
    add_header 'Access-Control-Allow-Headers' 'Content-Type, Accept, X-Requested-With';
    add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS, PUT, DELETE';

    location / {
        alias /var/cdn.ondrejsika.com/;
    } 
}
```

#### Source

* <http://serverfault.com/questions/384105/cross-origin-resource-sharing-cors-with-nginx-chrome>
* <http://stackoverflow.com/questions/227939/handling-options-request-in-nginx>

