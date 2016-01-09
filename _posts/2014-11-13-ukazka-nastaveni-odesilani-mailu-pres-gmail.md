---
layout: post
title: Ukazka nastaveni odesilani mailu pres Gmail

lang: CS
---

Je to jednoduche. Ukazka settings.py

    # Default mail settings for gmail
    EMAIL_HOST = 'smtp.gmail.com'
    EMAIL_HOST_USER = 'ondrejsika@gmail.com'
    EMAIL_HOST_PASSWORD = 'secretpassword'
    EMAIL_PORT = 587
    EMAIL_USE_TLS = True
    SERVER_EMAIL = EMAIL_HOST_USER
    DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
