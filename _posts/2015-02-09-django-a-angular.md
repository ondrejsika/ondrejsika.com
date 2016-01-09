---
layout: post
title: Django a Angular

lang: CS
---

{% raw %}

Pouzivani Django templates a angularu pouziva stejne znacky pro vkladani promennych __{{__ a __}}__. Django templates tyto zavorky zachyti a interpretuje, takze se do html k angularu nedostanou.

Muzeme na to jit 2 zpusoby, pred kazdym angularim tagem bychom mohly pouzit verbatim __{% verbatim %}{{ value }}{% endverbatim %}__ ale to neni moc prakticke. Dale bychom mohli tento tag dat kolem vice prvku ale tim ztratime moznost doplnovat nejaka data z Djanga.

Potom mame dalsi moznost ke ktere se priklamim ja a pouzivam ji a to je zmenit angulari zavorky na __[[__ a __]]__.

Kdyz inicializuji angular, metodou config je mohu zmeni na cokoliv jineho.

    var ngapp = angular.module('ngapp', []);
    ngapp.config(function($interpolateProvider) {
        $interpolateProvider.startSymbol('[[');
        $interpolateProvider.endSymbol(']]');
    });

A to je cele kouzlo, od ted se da pouzit __[[ value ]]__.

{% endraw %}
