---
layout: post
title:  "Cloning DB in PostgreSQL and MySQL"
categories: blog

lang: EN
---

### PostgresSQL

from bash

``` bash
su potgres
createdb target_db
pg_dump source_db | psql target_db
```

or from psql

``` sql
postgres=# CREATE DATABASE target_db WITH TEMPLATE source_db;
```


### MySQL

``` bash
echo "create database target_db" | mysql [-u user -ppasswd]
mysqldump source_db [-u user -ppasswd] | mysql target_db [-u user -ppasswd]
```
