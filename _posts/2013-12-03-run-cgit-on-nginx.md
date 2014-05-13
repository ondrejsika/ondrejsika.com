---
layout: post
title:  "Run Cgit on Nginx"
categories: blog

lang: EN
---

### Requirements

* gcc
* python
* supervisor
* nginx

### Cgit installation

Create cgit app directory.

``` bash
mkdir /var/cgit/
```

Download cgit stable version from <http://git.zx2c4.com/cgit/>

``` bash
cd /var/cgit/
wget http://git.zx2c4.com/cgit/snapshot/cgit-0.9.2.zip
unzip cgit-0.9.2.zip
```

Compile cgit

``` bash
cd cgit-0.9.2
make get-git
make
cd ..
```

Create CGI structure

``` bash
mkdir cgi-bin
cp cgit-0.9.2/cgit cgi-bin
cp cgit-0.9.2/cgit.css .
cp cgit-0.9.2/cgit.png .
```

Run CGI server

``` bash
python -m CGIHTTPServer
```
and open your browser on `http://localhost:8000/cgi-bin/cgit`


### Cgit confuguration

Add some repositories to `/etc/cgitrc`

```
repo.url=project1
repo.path=/home/projects/project1.git
repo.desc=Awesome project
repo.owner=Ondrej Sika

repo.url=project2
repo.path=/home/projects/project2.git
repo.desc=Other awesome project
repo.owner=Frantisek Kolovsky
```

### Supervisor configuration

Create config file `/etc/supervisor/conf.d/cgit.conf`

``` ini
[program:cgit]
command=python -m CGIHTTPServer 11155
directory=/var/cgit
```

And reload supervisor.

``` bash
service supervisor restart
```

### Nginx configuration

Create config file `/etc/nginx/site-available/cgit`

``` nginx
server {
    listen 80;
    server_name git.ondrejsika.com;

    location ~* ^.+\.(css|png|ico)$ {
        root /var/cgit;
    }

    location / { 
        rewrite  ^/$  /cgi-bin/cgit/ permanent;
        proxy_pass http://localhost:11155/;
    }   
}

```

Add to sites enabled

``` bash
ln -s /etc/nginx/sites-available/cgit /etc/nginx/sites-enabled/
```

and restart nginx

``` bash
service nginx restart
```
