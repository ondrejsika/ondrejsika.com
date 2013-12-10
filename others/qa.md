---
layout: default
title: Questions & Answers
---

## Questions & Answers

##### How create postgres datavase with encoding UTF-8?

Run `createdb database_name -l en_US.utf8 -E UTF8 -T template0` as user `postgres`.

##### How hide future post in Jekyll blog?

Add `future: false` to your Jekyll config `_config.yml`.

##### How get status or check/uncheck checkbox input with jQuery?

Get status with `$("#checkbox").prop("checked")`, return `true` for checked, `false` for unceck. For check/uncheck use 2nd parameter `true`/`false` of prop `$("#checkbox").prop("checked", true)`.

##### How hilight spaces on end of line in SublimeText?

Use package [TrailingSpaces](https://github.com/SublimeText/TrailingSpaces).

##### How remove all pyc files?

Run in shell `find . -name "*.pyc" -exec rm {} -f \; `.

##### How display more of error in django manage.py?

Use parameter `traceback`. Try run mange command like `python manage.py shell --traceback`.
