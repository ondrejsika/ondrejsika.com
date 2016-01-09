---
layout: post
title: Muj styl url ohledne modelu

lang: CS
---

Vetsinou jsem psal url ruzne, vetsinou v kazdem projektu jinak. Z toho pak vznikala rada nepresnosti a nejake chyby, ze jsem obcas pouzil jiny styl nez jsem chtel.

Ted jsem se rozhodl pro pouzivani jednotneho stylu vsude a uvidim, zda to bude fungovat. Samozrejmne to neni nejaka striktni defineice ale da se ji dobre drzer a ohybat pro potreby daneho projektu.

Dulezite je aby se dal nejak rozume resit namespace, proto je dulezity nejaky prefix. Idealne nazev modelu nebo aplikace. Ukazu na prikladu diare.

Mame strukturu projektu:

    company (app)
        Company (model)
        Department(model)

    person (app)
        Person (model)

Moje struktura je jednoducha, url se sklada z __/(model)/(id)/(akce)__.

Cast model je prefix Django aplikace a pokud je aplikace pouze s jednim modelem, tak tato cast je jen model. V nasem pripade /person/... . Pokud ma nase aplikace 2 a vice modelu, je nutne je rozlisit, v nasem pripade /company/company/... a /company/department/... .

Identifikator muze byt __id__ nebo nejaky __slug__ (e.g. my-awesome-company) podle pouziti. Id je lepsi v uzavrenych systemech, slug je vhodny pro web kvuli seo. Pokud vytvarim objekt, potom je id new.

Akce muze byt nejaka editace, galerie, ... .

Pak mam ale 2 specialni pripady, kde chybi cast akce nebo id. Prvni pripad je detail objektu, samozrejmne muzu psat __/(model)/(id)/detail/__ ale bez nej je to takove lidstejsi. Druhy pripad je list objektu, kde id nehraje roli. Proto staci psat __/(model)/__.

Toto je zakladni model, ktereho se drzim pro zakladni strukturu url. Resi pouze obecne situace, ktere se casto vyskytuji, konktetni veci resim vzdy v kontextu daneho projektu.

Pak by url mohly vypadat asi takto:

    /company/company/
    /company/company/new/
    /company/company/1/
    /company/company/1/edit/
    /company/company/1/delete/
    /company/department/
    /company/department/new/
    /company/department/1/
    /company/department/1/edit/
    /company/department/1/delete/
    /person/
    /person/new/
    /person/1/
    /person/1/edit/
    /person/1/delete/

