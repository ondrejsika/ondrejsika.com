---
layout: post
title: Závody v orientačním běhu v OE2010 pod linuxem ve VirtualBoxu
categories: blog

lang: CZ
---

Ještě před několika lety jsem si nedokázal představit možnost pořádání závodů v orientačním běhu na linuxu. Ani dnes tomu jěšte tak nebylo, ale už je vidět velké zlepšení. Závody v orientačním běhu náš oddíl (OK Lokomotiva Plzeň) pořádá vždy v OE2010 od Stephana Kramera. Tento program je vyvíjen pouze pro Windows.

Dříve jsem si musel nainstalovat windows přímo na disk a mít dual boot, pokud jsem se chtěl vyvarovat komplikacím s tiskem a čtením z SI jednotek (sériový port nebo usb). V té době byl k dispozici pouze VirtualBox 3, jehož podpora I/O zařízení nebyla velká. Další nevýhodou byly občasné chyby v grafickém prostředí, většinou dynamické prvky.

Revoluce přišla až s VirtualBoxem 4, který vyřešil všechny tyto problémy. Osoušel jsem jej již před rokem, na několika menších závodech oblastního žebříčku v minulém roce a schcledal jsem tuto variantu jako dostatečně stabilní abych ji mohl púoužít na závody žebříčku A.

Ale i letos přibylo pár novinek, třeba síťové spojení počítačů s OE2010. Server (síťový disk Windows) byl sice na PC s nativními Windowsi, ale možnosti networkingu ve VirtualBoxu umožnují i přístup i virtualizovanému systému přez síť. Vše fungovalo správně a rychle, jen vyčítací SI jednotky byly na virtualizovaném Windows o trochu pomalejší než na nativním systému.

Závěrem chci shrnout, že OE2010 již úspěšně běží pod novým VirtualBoxem a není třeba mít obavy při jeho používání.

Ostatní ze závodů
Pár fotek na [Google+](https://plus.google.com/u/0/photos/103792510103800752680/albums/5890179747383720001) a fotky od [Ines](http://ines-photo.rajce.idnes.cz/Sedmihori_-_zakulisi/)

Oficiální web závodů [lpm.zcu.cz/za2013](http://lpm.zcu.cz/za2013/)