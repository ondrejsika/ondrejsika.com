---
layout: post
title: Cache page v zavislosti na uzivateli

lang: CS
---

Problem dekoratoru cache page je v tom ze nerespektuje jaky uzivatel a zda je vubec prihlasen. Proto je dobre vytvorit si vlastni dekoratory zalozene na __django.views.decorators.cache.cache_page__.

Prvni pripad je ten, ze nam staci v cache rozlisovat dva stavy, zda je uzivatel prihlasen nebo ne. To resi tento dekorator:

    from django.views.decorators.cache import cache_page

    def cache_by_auth(timeout):
        def decorator(view_func):
            @wraps(view_func, assigned=available_attrs(view_func))
            def _wrapped_view(request, *args, **kwargs):
                return cache_page(timeout, key_prefix="_auth_%s_" % request.user.is_authenticated())(view_func)(request, *args, **kwargs)
            return _wrapped_view
        return decorator

Nebo muzeme chtit cachovat stranku pro kazdeho uzivatele zvlast, pouzijeme drobnou modifikaci predchoziho dekoratoru:

    from django.views.decorators.cache import cache_page

    def cache_by_user(timeout):
        def decorator(view_func):
            @wraps(view_func, assigned=available_attrs(view_func))
            def _wrapped_view(request, *args, **kwargs):
                return cache_page(timeout, key_prefix="_user_%s_" % request.user.id)(view_func)(request, *args, **kwargs)
            return _wrapped_view
        return decorator

Pouziti je pak u obou stejne:

    @cache_by_auth(3600)
    def view(request):
        return render(request, 'template.html')

    @cache_by_user(3600)
    def view2(request):
        return render(request, 'template2.html')

Cache klice potom vypadaji takto. Pro __cache_by_auth__ jsou tyto 2 varianty:

    views.decorators.cache.cache_page._auth_True_.GET.123456.123456
    views.decorators.cache.cache_page._auth_False_.GET.123456.123456

a pro __cache_by_user__ muze nastat ze uzivatel neni prilasen:

    views.decorators.cache.cache_page._user_None_.GET.123456.123456

a uzivatel s id treba 1

    views.decorators.cache.cache_page._user_1_.GET.123456.123456

#### Zdroje

* <https://stackoverflow.com/questions/11661503/django-caching-for-authenticated-users-only>
