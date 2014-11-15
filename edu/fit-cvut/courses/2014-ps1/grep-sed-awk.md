---
layout: base
title: grep, sed, awk / Programovani v shellu 1 (BIK-PA1) (2014) / FIT CVUT
---

[Programovani v shellu 1 (BIK-PS1) (2014)](.)

## {{ page.title }}

grep, sed a awk se daji pouzit jako prikazy i jako filtry.

``` bash
grep '[0-9]G' data.txt
```

je stejne jako

``` bash
cat data.txt | grep '[0-9]G'
```

### grep

Vytiskne pouze radky odpovidajici vyrazu

```
grep [prepinace] 'vzor' [soubory]
```

Prepinace:

* `i` - case insensitive
* `v` - vypise pouze radky ktere neobsahuji vzor
* `c` - vypise pouze pocet odpovidajicich radek
* `l` - vypise pouze soubory ktere obsahuji dany radek
* `n` - vypise odpovidajici radky s cislem radku
* `E` - rozsireny regexp (egrep)
* `F` - fixni retezec (fgrep)

#### egrep

Ekvivalent k `grep -E`

```
egrep '^no(fork|group)' /etc/group
```

misto

```
grep '^no\(fork\|group\)' /etc/group
```

#### fgrep

Ekvivalent k `grep -F`

vzor neni regularni vyraz ale obycejny retezec. Je rychlejsi nez `grep`.

### sed

S prazdnym prikazem funguje jako cat. `sed '' file.txt` je stejne jako `cat file.txt`.

```
sed [prepinace] 'prikaz' [soubory]
```

Prepinace:

* `-n` - potlaci automaticke kopirovani vystupu
* `-f` - nacteni scriptu ze souboru

Prikazy:

* `d` - zrusi radku
* `p` - vypise radku
* `s/RE1/RE2/?` - nahradi regexp RE1 retezcem RE2. ? jsou volby. (jako vim)
* `q/RE/` - ukonci vstup narazi li na RE1

### awk

Programovatelny filtr vytvoreny: __A__ho. __W__einberg, __K__ernigham

Podle vzoru se vyberou radky a provedou se s nimi urcite operace.

Radku prohlizi jako posloupnost $1, $2, ..., $n oddelenou mezarami (oddelovacem). $0 je celi radek.

Prepinace:

* `F` - oddelovac

Vzory:

* `BEGIN` - pred zpracovanim prvni radky
* `END` - po zpracovani posledni radky
* `vyraz` - pro radky vyhovujici danemu vyrazu
* `zacatek,konec` - pro radky zacinajici vyrazem zacatek a konci vyrazem konec

Typy vyrazu:

* regexp - format pro egrep
* logicky vyraz

Logicke vyrazi:

* operatory jako v c
* relacni
* matematicke
* logicke

Preddefinovane promenne:

* `$n` - hodnote n-te polozky z radku
* `NF` - pocet polozek v aktualnim radku
* `NR` - cislo aktualni radky
* `FS` - vstupni oddelovac polozek na radku
* `OFS` - vystupni oddelovac polozek na radku

Podminka `if` a cykly jako v C. dale `for i in range`

Preddefinovane funkce:

* sin, sqrt, log, exp, ...
* system
* length, match, split, substr, sub, ...
* tolower, toupper, ...

#### Priklady

datovy soubor __data__:

```
Steve      Jobs       Apple      30
Bill       Gates      Microsoft  35
Mark       Zuckerberg Facebook   25
Peter      Thiel      Paypal     40
Elon       Musk       Tesla      8
```

Soucet majetku

```
awk '{c = c + $4}END {print c;}' data
138
```

Prumer

```
awk '{c = c + $4}END {print c/NR;}' data
27.6
```

