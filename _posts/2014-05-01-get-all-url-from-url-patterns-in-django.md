---
layout: post
title: Get all url from url patterns in Django
categories: blog

lang: EN
meta_keywords: django, url, urlpatterns, url patterns
---

``` python
import re

named_group_matcher = re.compile(r'\(\?P(<\w+>).+?\)')
non_named_group_matcher = re.compile(r'\(.*?\)')

def simplify_regex(pattern):
    pattern = named_group_matcher.sub(lambda m: m.group(1), pattern)
    pattern = non_named_group_matcher.sub("{}", pattern)
    pattern = pattern.replace('^', '').replace('$', '').replace('?', '')\
        .replace('//', '/').replace('\\', '').replace('<', '{').replace('>', '}')
    if not pattern.startswith('/'):
        pattern = '/' + pattern
    return pattern

def get_urls(urlpatterns):
    urls = []
    def parse(urlpatterns, prefix=''):
        for entry in urlpatterns:
            if entry.__class__.__name__ == 'RegexURLPattern':
                urls.append(simplify_regex(prefix+entry.regex.pattern))
            else:  # entry.__class__.__name__ == 'RegexURLResolver'
                parse(entry.url_patterns, prefix+entry.regex.pattern)
    parse(urlpatterns)
    return urls
```

``` python
>>> from foo import get_urls
>>> from urls import urlpatterns
>>> get_urls(urlpatterns)
['/',
 '/about/',
 '/article/{}/',
 '/archive/{year}/{month}/']
```


#### Sources

* <http://code.activestate.com/recipes/576974-show-all-url-patterns-in-django/>
* <https://github.com/django/django/blob/master/django/contrib/admindocs/views.py>

