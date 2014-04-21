---
layout: post
title: Example of Postgres function in Python
categories: blog

lang: EN
meta_keywords: postgres, psql, plpython, python
---

You must install PLPython extension

```
apt-get install postgresql-plpython-9.3
```

### Example 1

``` sql
CREATE FUNCTION python_pow(x integer, n integer)
RETURNS integer AS $$
return x ** n
$$ LANGUAGE 'plpythonu';
```

``` sql
sika=# select python_pow(3, 3);
 python
--------
     27
(1 row)
```


### Example 2

``` sql
CREATE FUNCTION python_pow(integer, integer)
RETURNS integer AS $$
return args[0] ** args[1]
$$ LANGUAGE 'plpythonu';
```

