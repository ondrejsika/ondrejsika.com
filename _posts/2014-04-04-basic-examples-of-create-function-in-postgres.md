---
layout: post
title: Basic examples of CREATE FUNCTION in PostgreSQL
categories: blog

lang: EN
meta_keywords: vagrant, postgres, postgis, ubuntu
---

### Example 1

``` sql
CREATE FUNCTION foo(a INTEGER, b INTEGER)
RETURNS INTEGER as $$
    SELECT a + b;
$$ LANGUAGE 'sql';
```

``` sql
sika=# select foo(1, 2);
 foo
-----
   3
(1 row)
```


### Example 2

``` sql
CREATE OR REPLACE FUNCTION foo(a INTEGER, b INTEGER, c INTEGER)
RETURNS INTEGER AS $$
BEGIN
    IF a != 0 THEN
        RETURN b;
    END IF;
    RETURN c;
END;
$$ LANGUAGE plpgsql;

```

``` sql
sika=# select foo(1,2,3), foo(0,2,3);
 foo | foo
-----+-----
   2 |   3
(1 row)
```


### Example 3

``` sql
CREATE OR REPLACE FUNCTION foo(a INTEGER, b INTEGER, c INTEGER)
RETURNS INTEGER AS $$
DECLARE
    total INTEGER;
BEGIN
    total = a + b + c;
    RETURN total;
END;
$$ LANGUAGE plpgsql;
```

``` sql
sika=# select foo(1,2,3);
 foo
-----
   6
(1 row)
```


### Sources

* <http://www.postgresqlforbeginners.com/2010/12/create-function-return-types.html>
