---
layout: post
title:  "Install Redmine on Debian with Nginx"
categories: blog

lang: EN
meta_keywords: Redmine, Nginx, Debian, Redmine install, Supervisor, Ruby
---

### Install redmine

#### Download redmine

Download or clone redmine to `/var/redmine`

#### Install deb requirements

```
apt-get install nginx supervisor ruby rubygems ruby-dev libmagickwand-dev
```

Choose database. For postgres

```
apt-get install postgresql-server-dev-9.1
```

for sqlite

```
apt-get install libsqlite3-dev
```


#### Install Ruby package

```
gem install bundler
gem install rubyzip
```

#### Create DB config

```
cd /var/redmine
cp config/database.yml.example config/database.yml
vim config/database.yml  # edit default config
```

### Install ruby depences

```
bundle install
```

#### Migrate DB

```
RAILS_ENV=production bundle exec rake db:migrate
```

#### Generate secret token

```
rake generate_secret_token
```

#### Run

Run server on port 3000.

```
ruby script/rails server webrick -e production
```
### Supervisor config

File `/etc/supervisor/conf.d/redmine.conf`

```
[program:redmine]
command = ruby script/rails server webrick -e production
directory = /var/redmine
```

and reload supervisor.

```
supervisorctl reload
```

### Nginx config

in file `/etc/nginx/sites-available/redmine`

```
server {
    listen 80;
    server_name redmine.ondrejsika.com;

    location / {
        proxy_pass http://localhost:3000/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

add symbolic link to site-enabled

```
ln -s /etc/nginx/sites-available/redmine /etc/nginx/sites-enabled/
```

and restart nginx

```
service nginx restart
```

That's all :) You may log in to redmine as __admin__ with password __admin__.
