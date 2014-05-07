---
layout: post
title: Simple list filter on related models in Django Admin
categories: blog

lang: EN
meta_keywords: django, django admin, django filter, list filter, django list filter
---

We have simple model:

``` python
class Author(models.Model):
    name = models.CharField(max_length=64)
    is_czech = models.BooleanField()

class Book(models.Model):
    title = models.CharField(max_length=64)
    author = models.ForeignKey(Author)
```

Create simple list filter class

``` python
class AuthorsNacionalityFilter(admin.SimpleListFilter):
    title = _("Author's nacionalyty")
    parameter_name = 'authors_nacionality'

    def lookups(self, request, model_admin):
        return (
            ('czech', _('Czech')),
            ('other', _('Others')),
        )

    def queryset(self, request, queryset):
        if self.value() == 'czech':
            return queryset.filter(author__is_czech=True)
        if self.value() == 'other':
            return queryset.filter(author__is_czech=False)
        return queryset
```

And use in ModelAdmin:

``` python
class BookAdmin(models.ModelAdmin):
    list_filter = (
        AuthorsNacionalityFilter,
    )
```

