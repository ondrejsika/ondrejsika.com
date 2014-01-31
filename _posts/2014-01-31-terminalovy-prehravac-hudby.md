---
layout: post
title: Terminálový přehrávač hudby
categories: blog

lang: CZ
meta_keywords: terminal, cli, hudebni prehravac, hudba, linux, console, music player
---

Jako dlouholetý uživatel linuxu a hlavně [i3wm](http://i3wm.org) mám radši terminálové aplikace, pokud plně nahradí ty grafické. Netvrdím, že Lynx nahradí Chrome, ale co přehrávač hudby? Potřebuje opravdu grafické okno?

Já jsem našel [MOC](http://moc.daper.net/) a ihned po instalaci jsem zjistil, že je te pravý. Ovládání má opravdu jednoduché a intuitivní, pro nápovědu stačí zmáčknout `h`.

#### Instalace

```
apt-get install moc
```

#### Spuštění klienta

```
sika@x1:~$ mocp
```

Další výhodou je že MOC je rozdělen na server a kient, přičemž klientů může být spuštěno více a tak můžete ovládat hudbu třeba přes SSH. Umí tohle třeba Wincows Media Center nebo VLC? :)

![MOC screenshot](/static/content/muc.png)
