---
layout: post
title: Related list display in Django Admin with ordering
categories: blog

lang: EN
meta_keywords: django, list display, django admin, related
---

We have simple model:

``` python
class Author(models.Model):
    name = models.CharField(max_length=64)

class Book(models.Model):
    title = models.CharField(max_length=64)
    author = models.ForeignKey(Author)
```

In admin we must create simple function, for list display.

``` python
def book_author_name(obj):
    return obj.author.name
book_author_name.admin_order_field = 'author__name'
```

This function use in ModelAdmin list display:

``` python
class BookAdmin(models.ModelAdmin):
    list_display = (
        'title',
        book_author_name,
    )
```

