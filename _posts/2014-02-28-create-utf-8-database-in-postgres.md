---
layout: post
title:  Create UTF-8 database in PostgreSQL
categories: blog

lang: EN
meta_keywords: postgres, postgesql, create datapase, utf8, utf-8
---

### in bash

```
postgres@x1:~$ createdb database_name -l en_US.utf8 -E UTF8 -T template0
```

### in psql

```
postgres=# CREATE DATABASE database_name ENCODING 'UTF8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8' TEMPLATE=template0;
```