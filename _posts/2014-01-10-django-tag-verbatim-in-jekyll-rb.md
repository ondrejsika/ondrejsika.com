---
layout: post
title: Django tag verbatim in Jekyll
categories: blog

lang: EN
meta_keywords: django, jekyll, jekyllrb, verbatim, raw
---

{% raw %}

Django template processor and Jekyll use `{{ }}` and `{% %}` for render templates. If you want print this strings you must escapte text.

In Django use blog tag `{% verbatim %}`, in Jekyll use `{% raw %}`

{% endraw %}
