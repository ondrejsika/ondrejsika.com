---
layout: post
title: Unix Timpestamp to Date at SQL
categories: blog

lang: EN
---


### postgres

date to timestamp

    select extract(epoch from timestamp '2011-01-02 03:04:05');

timestamp to date

    select to_timestamp(1293937445)


### mysql

date to timestamp

    select UNIX_TIMESTAMP('15-01-01 00:00')

timestamp to date

    select FROM_UNIXTIME(1293937445)



