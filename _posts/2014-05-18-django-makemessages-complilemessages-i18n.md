---
layout: post
title: Django makemessages, compilemessages (i18n)
categories: blog

lang: EN
meta_keywords: django, makemessages, compilemessages, i18n
---

Simple scripts to make and complile all languages in Django.

### makemessages.sh

``` bash
#!/bin/bash

langs=`python -c "from project import settings; print ' '.join((code for code, name in settings.LANGUAGES[1:]))"`

for lang in $langs; do
    django-admin.py makemessages -l $lang
    django-admin.py makemessages -l $lang -d djangojs
done
```

### compilemessage.sj

``` bash
#!/bin/bash

django-admin.py compilemessages
```
