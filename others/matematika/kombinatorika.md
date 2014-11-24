---
layout: default_math
title: Kombinatorika
---

## {{page.title}}

### Variace

Vektor z mnoziny.

$k$ - rozmer vektoru, $n$ - pockej prvku zdrojove mnoziny

Bez opakovani

$$ V_k (n) = \frac{n!}{(n-k)!} $$ 

S opakovanim

$$ V' _k (n) = n^k $$ 

### Permutace

Zvlastni pripad variaci kde $k = n$.

Bez opakovani

$$ P(n) = n! $$

S opakovanim

$r$ - pocet sobe rovnych prvku

$$ P _r (n)  = \frac{n!}{r!} $$

### Kombinace

Podmnozina z mnoziny

$k$ - pocet prvku cilove mnoziny, $n$ - pocet prvku zdrojove mnoziny

Bez opakovani

$$ C_k (n) = \frac{n!}{k!(n-k)!} = {n \choose k} $$

S opakovanim

$$ C' _k (n) = \frac{(n+k-1)!}{k!(n-1)!} = {n+k-1 \choose n-1} $$


