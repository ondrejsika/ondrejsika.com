---
layout: post
title:  "VIM - naprosté základy"
date:   2013-06-22 00:00:00
categories: blog

lang: CZ
---

Vim je jeden z nejlepších textových editorů, ale málo lidí ho dokáže používat, natož využít jeho výhod. Tento článek nastíní opravdu jen práci s VIMem.


### Vim se otevírá takto
```
$ vim soubor.txt
```

Základem pochopení práce s VIMem je pochopit 2 módy: editační a příkazový. Po spuštení VIMu se octnete v příkazovém módu.

### Ukládání
:w - Uložení změn
<br>:w /path/to/file - uloží kopii do souboru /path/to/file</p>

### VIM se ukončuje příkazy
:q - ukončí
<br>:q! - ukončí a zahodí změny
<br>:wq - uloží změny a ukončí se
<br>:x - uloží změny a ukončí se

Proto, aby jste mophli začít psát musíte stisknout klávesu "i". Z režimu psaní se dostanete zpět klávesou "esc".

To byly opravdu nejdůležitější příkazy VIMu. Tyto už nejsou tak důležité, ale hodí se je znát.

### Kopírování, vyjímání a vkládání
Bez těchto 3 operací si asi úpravu textu představit nedokážeme, a ve VIMu se dělají velmi jednoduše. Pokud chcete vybrat urřitý text, stiskněte `v`. Potom si označte oblast kterou chcete skopírovat nebo vyjmout. Pro kopírování zmáčněte `y` a pro vyjmutí `d`. Text se vým uložil do paměti a vložíte ho zmáčknutím klávesy `p`.

v - označí text
<br>y - zkopíruje
<br>d - odstraní / vyjme
<br>p - vloží

### Pohyb v textu
Dále je důležité se v textu efektivně pohybovat.

:&lt;number&gt; - skočí na určitou řádku v souboru
<br>gg - skočí na první řídku
<br>G - skočí na poslendí řádku
<br>{ - skočí na začátek bloku (bloky jsou odděleny prázdnou řádkou)
<br>} - skočí na konec bloku

### Vyhledávání, Nahrazovaní
/&lt;search&gt; - najde první výskyt &lt;search&gt;, pro další výskyt "b", pro předchozí "n"
<br>:%s/&lt;search&gt;/&lt;replace&gt;/g - v celém souboru najde a nahradí &lt;search&gt; výzazem &lt;replace&gt;

### Mazání
Můžete mazat v režimu editace textu pomocí "backspace" nebo "delete" a nebo můžete použít tyto příkazy:

dd - smaže aktuální řádku.
<br>d{ - smeže blok od aktuální pozice do konce
<br>d} - smaže blok od aktuální pozice do začátku
<br>dG - smaže od aktuální pozice do konce souboru
<br>dgg - smaže od aktuální pozice do začátku souboru

A to je asi vše co potřebujete o VIMu vědět, aby se Vám v něm dobře pracovalo :)