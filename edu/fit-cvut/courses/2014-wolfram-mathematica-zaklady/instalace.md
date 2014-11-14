---
layout: base
title: Instalace / Wolfram Mathematica (zaklady) (2014) / FIT CVUT
---

[Wolfram Mathematica (zaklady) (2014)](.)

## {{ page.title }}


Instalacni soubor stahnete z <https://download.cvut.cz/info/info.php?id=179> (ma priblizne 2.6 GB) a spuste. Pri instalaci nechte vsude nechte defaultni umisteni.

```
sh Mathematica_10.0.1_LINUX.sh
```


Pred kazdym zpustenim je nutne si pripojit MathLM server prikazem:

```
ssh sikaondr@fray1.fit.cvut.cz -L 16286:leibniz.feld.cvut.cz:16286
```

Pak si muzete prikazem spustit grafickou verzi programu:

```
mathematica
```

A pak jen nastavit aktivaci prez sit a nastavit adresu serveru na `127.0.0.1`.

Je to hezky popsane zde: <https://edux.fit.cvut.cz/courses/BI-CAO/manual/tunnel>

Dale se da spoustet mathematica z shellu:

```
sika@x1:~$ math
Mathematica 10.0 for Linux x86 (64-bit)
Copyright 1988-2014 Wolfram Research, Inc.

In[1]:=

```

a pokud chcete spoustet skript:

```
{% raw %}sika@x1:~$ math -script equation.nb
{{x -> -1 - 2*Sqrt[2]}, {x -> -1 + 2*Sqrt[2]}}{% endraw %}
```


