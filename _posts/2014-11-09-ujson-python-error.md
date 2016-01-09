---
layout: post
title: ujson python error

lang: CS
---

Obcas se mi stalo ze jsem omylem poslal do ujsonu nejaky generator, ktery nezachitil python block try-except a
vyhodilo to takovouto chybu.

    *** Error in `/usr/bin/python': realloc(): invalid next size: 0x00007f1788244050 ***

Tuto C chybu to hlasi, protoze je ujson implementovan pro rychlost v C a python na nej saha prez .so knihovnu.
Happy debugging :)
