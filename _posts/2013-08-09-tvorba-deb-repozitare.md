---
layout: post
title:  "Tvorba deb repozitáře"
date:   2013-08-09 00:00:00
categories: blog

lang: CZ
---


Jak vytvořit DEB balíčky už umíme, těď jen způsob jejich distribuce. Nejlepší možností je vytvořit vlastní APT repozitář.

Nejdřive si vytvoříme souborovou strukturu na webovém serveru.

```
cd /var/www/debianrepo
mkdir all
mkdir amd64
mkdir i386
mkdir source
```

Do adresářů třídíme balíčky podle architektury. Skopirujte vaše balíčky do příslušných složek.

```
cp ~/deb/helloworld_1~ondrejsika-1_all.deb /var/www/debianrepo/all
```

Teď je důležité vytvořit packages index. Příkazem dpkg-scanpackages [dir] /dev/null | gzip -9c > [dir]/Packages.gz

```
dpkg-scanpackages all /dev/null | gzip -9c > all/Packages.gz
dpkg-scanpackages amd64 /dev/null | gzip -9c > amd64/Packages.gz
dpkg-scanpackages i386 /dev/null | gzip -9c > i386/Packages.gz
dpkg-scanpackages source /dev/null | gzip -9c > all/Sources.gz
```

Repozitář je hotový, po přidání dalšího balíčku je nutné znova vytvořit index.

### Přidání repozitáře

Repozitář se přidá do souboru /etc/apt/sources.list

```
echo "deb http://localhost/debianrepo/ all/" >> /etc/apt/source.list
echo "deb http://localhost/debianrepo/ amd64/" >> /etc/apt/source.list
echo "deb http://localhost/debianrepo/ i386/" >> /etc/apt/source.list
echo "deb-src http://localhost/debianrepo/ source/" >> /etc/apt/sources.list
apt-get update
```

Pak se už dalí instalovat balíčky pomocí apt-get

```
apt-get install helloworld
```