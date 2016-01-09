---
layout: post
title: Vypnuti Disallowed host emailu adminum

lang: CS
---

I kdyz jsem mel nastavene logovani do sentry, presto chodily maily adminum o pristupu se spatnym hostname.

    LOGGING = {
        'version': 1,
        'handlers': {
            'sentry': {'class': 'raven.contrib.django.handlers.SentryHandler'},
        },
        'loggers': {
            '': {'handlers': ['sentry']},
        },
    }

Puvodni nastaveni logovani do sentru neprepisuje nastaveni loggeru __django.security.DisallowedHost__. Proto se posilaji emaily takoveho tvaru.

    Subject: [Django] ERROR: Invalid HTTP_HOST header: 'localhost:8000'.You may need
     to add u'localhost' to ALLOWED_HOSTS.

    No stack trace available

    Request repr() unavailable.

V settings pridame dalsi nastaveni loggeru a dame ze se nema propagovat.

    LOGGING = {
        'version': 1,
        'handlers': {
            'sentry': {'class': 'raven.contrib.django.handlers.SentryHandler'},
        },
        'loggers': {
            '': {'handlers': ['sentry']},
            'django.security.DisallowedHost': {'propagate': False},  # pridana pouze tato radka
        },
    }

Pote uz se emaily neposilaji.

