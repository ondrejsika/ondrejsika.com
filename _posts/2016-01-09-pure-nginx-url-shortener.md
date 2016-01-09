---
layout: post
title: Pure NGINX URL shortener
categories: blog

lang: EN
---

This is an example simple URL shortener just in NGINX. This is a server config.

    server {
        listen 80;
        server_name url.os1.cz;
        location / {
            default_type 'text/plain';
            echo 'url.os1.cz';
        }

        rewrite ^/kurzy-spse(/|)$
            https://ondrejsika.com/edu/spse-plzen/1415/;

        rewrite ^/kurzy-spse-2015(/|)$
            https://ondrejsika.com/edu/spse-plzen/1516/;
    }

Example of call with trailing slash

    sika@sika-x1:~$ curl -I http://url.os1.cz/kurzy-spse/
    HTTP/1.1 302 Moved Temporarily
    Server: nginx/1.4.7
    Date: Fri, 08 Jan 2016 23:57:38 GMT
    Content-Type: text/html
    Content-Length: 160
    Connection: keep-alive
    Location: https://ondrejsika.com/edu/spse-plzen/1415/

and without

    sika@sika-x1:~$ curl -I http://url.os1.cz/kurzy-spse
    HTTP/1.1 302 Moved Temporarily
    Server: nginx/1.4.7
    Date: Fri, 08 Jan 2016 23:57:41 GMT
    Content-Type: text/html
    Content-Length: 160
    Connection: keep-alive
    Location: https://ondrejsika.com/edu/spse-plzen/1415/

This is an example non existing url

    sika@sika-x1:~$ curl -i http://url.os1.cz/non-existing
    HTTP/1.1 200 OK
    Server: nginx/1.4.7
    Date: Fri, 08 Jan 2016 23:58:02 GMT
    Content-Type: text/plain
    Transfer-Encoding: chunked
    Connection: keep-alive

    url.os1.cz

- Advantages: easy to manage, easy to setup
- Disadvantages: need nginx restart after update

