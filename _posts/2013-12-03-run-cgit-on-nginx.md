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

```
mkdir /var/cgit/
```

Download cgit stable version from <http://git.zx2c4.com/cgit/>

```
cd /var/cgit/
wget http://git.zx2c4.com/cgit/snapshot/cgit-0.9.2.zip
unzip cgit-0.9.2.zip
```

Compile cgit

```
cd cgit-0.9.2
make get-git
make
cd ..
```

Create CGI structure

```
mkdir cgi-bin
cp cgit-0.9.2/cgit cgi-bin
cp cgit-0.9.2/cgit.css .
cp cgit-0.9.2/cgit.png .
```

Run CGI server

```
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

```
[program:cgit]
command=python -m CGIHTTPServer 11155
directory=/var/cgit
```

And reload supervisor.

```
service supervisor restart
```

### Nginx configuration

Create config file `/etc/nginx/site-available/cgit`

```
server {
    listen 80;
    server_name git.ondrejsika.com;

    location ~* ^.+\.(css|png|ico)$ {
        root /var/cgit;
    }

    location / {
        proxy_pass http://localhost:11155/cgi-bin/cgit;
    }
}

```

Add to sites enabled

```
ln -s /etc/nginx/sites-available/cgit /etc/nginx/sites-enabled/
```

and restart nginx

```
service nginx restart
```