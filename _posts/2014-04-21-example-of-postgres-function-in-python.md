---
layout: post
title: Example of Postgres function in Python

lang: EN
---

You must install PLPython extension

    apt-get install postgresql-plpython-9.3


### Example 1

    CREATE FUNCTION python_pow(x integer, n integer)
    RETURNS integer AS $$
    return x ** n
    $$ LANGUAGE 'plpythonu';

    sika=# select python_pow(3, 3);
     python
    --------
         27
    (1 row)


### Example 2

    CREATE FUNCTION python_pow(integer, integer)
    RETURNS integer AS $$
    return args[0] ** args[1]
    $$ LANGUAGE 'plpythonu';

