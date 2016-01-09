---
layout: post
title: Prihlaseni uzivatele bez hesla

lang: CS
---

Pokud chci mit moznost prihlasit se k uzivateli bez hesla, treba pro to aby nekdo ze supportu mel stejny pohled jako uzivatel, potrebuji se prihlasit do aplikace treba nejakym suppor uctem a pak si zvolit na jakeho uzivatele mam prepnout. Nejjednodusi metoda je toto:

    from django.contrib.auth import login
    from django.contrib.auth.models import User

    def view(request):
        user = User.objects.get(id=1)
        user.backend = 'django.contrib.auth.backends.ModelBackend'
        login(request, user)
        return HttpResponseRedirect('/')
