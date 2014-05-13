---
layout: post
title:  "Tvorba Python balíčku"
date:   2013-08-09 00:00:00
categories: blog

lang: CZ
---

Jak jednoduše vytvořit python balíčk, nahrát ho na pipi.python.org a instalovat přes pip.

Nejdříve si vytvoříme složku ve které budeme balíček vytvářet a přepneme se do ní

``` bash
$ mkdir ~/pip/helloworld/
$ cd ~/pip/helloworld/
```

zde si vytvoříme pythoní knihovnu která musí obsahovat python package. Za pyhon package se považuje složka ve které je soubor `__init__.py`. Zde vytvoříme tedy složku s názvem našeho balíčku. Znovu `helloworld` a v ní vytvoříme prázdný soubor `__init__.py`.

``` bash
$ mkdir helloworld
touch helloworld/__init__.py
```

Teď už máme základní strukturu naší knihovny. Můžeme do ní vkládat další soubory a podardesáře s python balíčky.
Do souboru `__init__.py` vložíme naši funkci `helloworld`.

obsah souboru `helloworld/__init__.py`
``` python
def helloworld():
    print "Hello world"
```

Knihonu máme hotovou, teď musíme vytvořit soubor setup.py kam zadáme potřebné informace o balíčku.

``` bash
$ vim setup.py
```

obsah souboru `setup.py`

``` python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages


setup(
    name = 'helloworld',
    version = '1',
    url = 'http://ondrejsika.com/helloworld',  # domovska stranka balicku
    author = 'Ondrej Sika',
    author_email = 'ondrej@ondrejsika.com',
    packages = find_packages(),
    requires = [],  # pozadovane balicky
)
```

funkce setup má mnoho dalších parametrů, zde zmiňuji ty nejdůležitější

### Přidání balíčku pypi.python.org
Niní můžeme přidat balíček do python package index (pipi) příkazem

``` bash
$ python setup.py register
```

Pokud jste ještě žádný balíček neregistrovali, zeptá se vás program zda už máte účet, pokud a no zvolte 1, pokud ho chcete založit zvolte 2. Zadejte požadované údaje a na email Vám přijde potvrzovací email. Po potvrzení účtu rnovu proveďte příkaz 

``` bash
$ python setup.py register
```

zde zvolte možnost 1 a přihlašte se. balíček se zaregistruje na serveru. Potom se vás zeptá zda si chcete uložit přihlašovací údaje. Když si je uložíte, při registraci dalších balíčku budete pouze spouštet příkaz na registraci a nebudete muset nic zadávat.
Dále musíme na server nahrát vytvořený balíček v archivu .tar.gz. Ten vytvoříme příkazem

``` bash
$ python setup.py sdist
```

a nahrajeme ho na server příkazem

``` bash
$ python setup.py sdist upload
```

### Instalace balíčku do systému
Teď můžeme náš balíček nainstalovat příkazem

``` bash
# pip install helloworld
```
a nebo

``` bash
# python setup.py install
```

odstranění balíčku je pro oba příklady stejné

``` bash
# pip uninstall helloworld
```

