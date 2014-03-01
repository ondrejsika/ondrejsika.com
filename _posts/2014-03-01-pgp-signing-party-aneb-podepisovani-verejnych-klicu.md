---
layout: post
title: PGP signing party aneb podepisovani verejnych klicu
categories: blog

lang: CZ
meta_keywords: pgp, gpg, pgp sign party
---

Tento clanek je strucny, v budoucnu ho rozepisu :)

<br>

Nejdrive musime stahnout klic, pak ho podepsat a znovu odeslat na server.

Tento jednoduchy skript umoznuje tyto operace provadet v davce.

``` bash
while true
do
    read KEY_ID
    gpg --recv-keys --keyserver pgp.mit.edu $KEY_ID
    gpg --sign-key $KEY_ID
    gpg --send-keys --keyserver pgp.mit.edu $KEY_ID
done
```
