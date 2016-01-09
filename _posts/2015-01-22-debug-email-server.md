---
layout: post
title: Debug email server

lang: CS
---

Debug server vypisuje tela emailu do konzole. Tento system vetsinou nepouzivam, nechavam si testovaci emaily posilat na testovaci adresy. Ale porad tento zpusob ma nekolik vyhod.

* Prvni vyhodoou je ze funguje offline, pokud pracujete v letadle nebo ve vlaku, bude se vam to hodit.
* Dalsi velka vyhoda je ze pokud neco testujete s produkcnimi daty, nestane se vam ze omylem poslete nechteny email.

Emailovy server se spousti prikazem

    python -m smtpd -n -c DebuggingServer localhost:1025

A pokud chcete spoustet na portu 25, tak musite byt root

    sudo python -m smtpd -n -c DebuggingServer localhost:25

Pokud ho nepoustite pod rootem, tak mu nejde pridelit port 25, standartne se proto pousti na portu 1025. Dale je treba nastavit tento port v settings. Pokud pouzoivate lokalni mailovy server, staci nastavit jen port na 1025.

    EMAIL_PORT = '1025'

Pokud mate nastaveni emailu na nejaky externi SMTP server (treba Gmail) tak je nutne prenastavit vsechno nastaveni

    EMAIL_HOST = 'localhost'
    EMAIL_PORT = '1025'
    EMAIL_HOST_USER = None
    EMAIL_HOST_PASSWORD = None
    EMAIL_USE_TLS = False
