---
layout: default
title: Others
---

## Questions & Answers

##### How remove all pyc files?

Run in shell `find . -name "*.pyc" -exec rm {} -f \; `.

##### How display more of error in django manage.py?

Use parameter `traceback`. Try run mange command like `python manage.py shell --traceback`.