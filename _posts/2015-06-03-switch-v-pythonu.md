---
layout: post
title: Switch v Pythonu

lang: CS
---

Python nema __switch__, misto nej muzeme pouzit __if__, __elif__, ...

To neni ale vykonove pro velke mnozstvi podminek vhodne, ale da se nahradit "vlastni implementaci" switche.

Kazdy blok kodu ktery se ma spracovat prave kdyz __a == b__ se zapise do funkce. Tyto funkce se nasledne vlozi do dictionary a potom se vola funkce z dictionary po klici, coz je efektivnejsi nez sekvencni zpracovani rady __if__.

Toto je jednoducha ukazka:

    # nadefinujeme si metody s bloky kodu pro vykonani

    def _do_first():
        print 'first'

    def _do_second():
        print 'second'

    def _do_third():
        print 'third'

    # vytvorime switch dictionary

    switch = {
        'first': _do_first,
        'second': _do_second,
        'third': _do_third,
    }

    # zavolame s konkretnim parametrem

    switch[variable]()

