---
layout: post
title: List display na related model v Django Admin

lang: CS
---

Nekdy je v potreba v Adminu zobrazit nejake udaje z related modelu.

    class Author(models.Model):
        name = models.CharField(max_length=64)

        def __unicode__(self):
            return u'%s' % self.name

    class Book(models.Model):
        title = models.CharField(max_length=64)
        author = models.ForeignKey(Author)

        def __unicode__(self):
            return u'%s' % self.title

Vytvorime si jedonoduchou funkci ktera vrati nejake pole (muze byt jakkoliv upraveno v funkci) a bylo by dobre
aby se podle nej dalo radit. Proto jeste k funkci pridame __admin_order_field__ coz je vyraz prez ktery bude queryset
radit (related_model__some_field).

    def book_author_name(obj):
        return obj.author.name
    book_author_name.admin_order_field = 'author__name'


    class BookAdmin(admin.ModelAdmin):
        list_display = (
            'title',
            book_author_name,
        )

