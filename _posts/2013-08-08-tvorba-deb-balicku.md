---
layout: post
title:  "Tvorba deb balíčku"
date:   2013-08-08 00:00:00
categories: blog

lang: CZ
---

Nejdříve si vytvoříme praconí adresáž na tvorbu deb balíčků `~/deb/` a přepneme se do něj.

```
$ mkdir deb
$ cd deb
```

Zde si vytvoříme adresář se stejným jménem jako název souboru balíčku, v našem případě `helloworld_1~ondrejsika-1_all.deb`. Název není jen tak vymyšlený první část je jméno programu a verze, další je autor balíčku a nakonec verze balíčku a platforma. V mém případě je balíček určen pro všechny platformy.

```
$ mkdir helloworld_1~ondrejsika-1_all
$ cd helloworld_1~ondrejsika-1_all
```

Zde musíme vytvořit složku `DEBIAN` a vložit do ní soubory se základními informacemi o balíčku. Stačí nám pouze soubor `control`. Do souboru control napište tyto nutné základní informace.

```
Package: helloworld
Version: 1 
Architecture: all 
Maintainer: Ondrej Sika <ondrej@ondrejsika.com>
Installed-Size: 1
Depends: bash
Priority: extra
Homepage: http://ondrejsika.com/
Description:
 Hello world app
```

To jsou informace o balíčku, které jsou poviné. Pokud zadáme příkaz `find`, máme zde jen složku `DEBIAN` a v ní soubor `control`.

```
$ find
.
./DEBIAN
./DEBIAN/control
```

Teď už můžeme vytvářet souborovou strukturu která odpovídá souborové strukturě z linuxového rootu. Vytvořím soubor `usr/bin/helloworld`, který znázorňuje `/usr/bin/helloworld`. Do tohoto souboru napište Váš script a nastavte ho jako spustitelný.

```
mkdir usr/bin/ -p
echo -e '#!/bin/bash\necho Hello world' > usr/bin/helloworld
chmod +x usr/bin/helloworld
```

Teď máme hotovo. Můžeme skontrolovat soubory v našem balíčku příkazem `find`.

```
$ ls
DEBIAN  usr
$ find
.
./usr
./usr/bin
./usr/bin/helloworld
./DEBIAN
./DEBIAN/control
```

Teď se přepneme z adresáře balíčku do našeho pracovního adresáře.

```
$ cd ..
$ pwd
~/deb/
$ ls
helloworld_1~ondrejsika-1_all
```

Niní můžeme balíček sestavit příkazem

```
$ dpkg-deb --build helloworld_1~ondrejsika-1_all helloworld_1~ondrejsika-1_all.deb
dpkg-deb: building package `helloworld_1~ondrejsika-1_all' in `helloworld_1~ondrejsika-1_all.deb'.
```

To je vše. Přeji hodně úspěchů při tvorbě vlastních balíčků.