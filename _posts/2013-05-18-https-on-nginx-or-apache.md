---
layout: post
title:  "HTTPS on Nginx or Apache2"
date:   2013-05-18 00:00:00
categories: blog

lang: EN
---

### Create certifiacate

Create RSA key (2048K) and certificate.

``` bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/ondrejsika.key \
    -out /etc/ssl/ondrejsika.crt \
    -subj '/O=Ondrej Sika/CN=ondrejsika.com'
```

### Nginx config for HTTPS server

``` nginx
server {
    listen               443;

    ssl                  on;
    ssl_certificate      /etc/ssl/ondrejsika.crt;
    ssl_certificate_key  /etc/ssl/ondrejsika.key;

    server_name ondrejsika.com www.ondrejsika.com;

    location / {
        alias /var/www/ondrejsika/;
        index index.html;
    }
}

```


### Redirect form HTTP

``` nginx
server {
       server_name ondrejsika.com www.ondrejsika.com;
       listen 80;
       rewrite ^(.*) https://ondrejsika.com$request_uri? permanent;
}
```

and restart nginx

``` bash
sudo service nginx restart
```


### Apache2 configuration

Enable mod SSL

``` bash
sudo a2enmod ssl
```


### HTTPS config

``` apache
<VirtualHost *:443>
    ServerName ondrejsika.com
    ServerAlias www.ondrejsika.com
    DocumentRoot "/home/www/"
    SSLEngine on
    SSLCertificateFile /etc/ssl/ondrejsika.crt
    SSLCertificateKeyFile /etc/ssl/ondrejsika.key
</VirtualHost>
```


### Redirect from HTTP

Must enable mod rewrite

``` bash
sudo a2enmod rewrite
```

``` apache
<VirtualHost *:80>
    ServerName localhost
    RewriteEngine On
    RewriteRule ^/(.*) https://%{SERVER_NAME}/$1 [L,R]
</VirtualHost>
```

and restart apache2

``` bash
sudo service apach2 restart
```
