---
layout: post
title: Struktura importu

lang: CS
---

Po nejake zkusenostu s Pythonem a Djangem jsem dospel k tomuto trizeni importu. Hodne mi to zvetsilo prehlednost kodu.

Do python casti davam pouze nativni pythoni knihovny, do sekce lib davam vsechny externi knihovny a balicky. Potom 
mam importy z djanga a pak z django contrib. Nakonec pisu importy z django aplikaci primo z projektu a potom importy
ze souboru ve stejnem adresari.

Ukazka hlavicky .py souboru:

    # python
    import datetime
    import json

    # lib
    import requests

    # django
    from django.db import models
    from django.conf import settings

    # django contrib
    from django.contrib.auth.models import User

    # project
    from otherapp.models import Profile

    # local
    from .utils import make_address

