---
layout: post
title: Kombinatorika v Pythonu

lang: CS
---


Zde uvedu funkce pro jednoduchou práci s kombinacemi, permutacemi a variacemi pomocí standartních knihoven Pythonu.

Většinu těchto funkcí obsahuje modul `itertools`, který je distribuován s Pythonem.

    >>> import itertools


### Kombinace
Kombinace jsou n-prvkové podmnožiny dané množiny kde každý prvek množiny může být použit pouze jednou. Nezáleží na požadí prvků.

#### itertools.combinations(iterable, n)
Tato funckce vrací n-size podmnožiny z iterable množiny, které obsahují každý prvek množiny iterable maximálně jednou.

##### Příklad
Pokud chceme vrátit všechny dvouprvkové podmnožiny bez opakování z prvků A, B a C.

    >>> tuple(itertools.combinations(("A", "B", "C"), 2))
    (('A', 'B'), ('A', 'C'), ('B', 'C'))


### Kombinace s opakováním
Kombinace jsou n-prvkové podmnožiny dané množiny. Nezáleží na požadí prvků.

#### itertools.combinations_with_replacement(iterable, n)
Tato funckce vrací n-size podmnožiny z iterable množiny, kde se prvky množiny iterable mohou opakovat.


##### Příklad
Pokud chceme vrátit všechny dvouprvkové podmnožiny z prvků A, B a C, kde se prvky A, B a C mohou opakovat.

    >>> tuple(itertools.combinations_with_replacement(("A", "B", "C"), 2))
    (('A', 'A'), ('A', 'B'), ('A', 'C'), ('B', 'B'), ('B', 'C'), ('C', 'C'))

### Permutace
Permutace jsou vektory (orientované n-tice). Záleží na pořadí prvků.

#### itertools.permutations(iterable, r=len(iterable))
Iterable je množina prvků permutace. Nepovinný parametr r je velikost premutace, pokud není zadán, délka permutace je stejná jako délka množiny prvků.

##### Příklad

    >>> tuple(itertools.permutations(("A", "B", "C")))
    (('A', 'B', 'C'),
     ('A', 'C', 'B'),
     ('B', 'A', 'C'),
     ('B', 'C', 'A'),
     ('C', 'A', 'B'),
     ('C', 'B', 'A'))

    >>> tuple(itertools.permutations(("A", "B", "C"), 2))
    (('A', 'B'),
     ('A', 'C'),
     ('B', 'A'),
     ('B', 'C'),
     ('C', 'A'),
     ('C', 'B'))

