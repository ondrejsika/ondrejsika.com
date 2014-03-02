---
layout: post
title:  Zakladni funkce a pouziti GnuPG
categories: blog

lang: CZ
meta_keywords: GPG, GnuPG, PGP
---

### Instalace PnuPG (GNU Privacy Guard)

V Debianu z repozitare

```
sudo apt-get install gnupg
```

timto prikazem nainstalujete jen terminalovy klient, pokud chcete nejakou grafickou nastavbu, zkuste GPA (GNU Privacy Assistant). V debianu jej nainainstajulete prikazem.

```
sudo apt-get install gpa
```

### Vygenerovani noveho klice

```
gpg --gen-key
```

### Vytvoreni revoke key

```
gpg --output ondrejsika_revoke.asc --gen-revoke ondrej@ondrejsika.com
```

### Export klicu

Export verejneho klice

```
gpg --output ondrejsika_public.asc --armor --export ondrej@ondrejsika.com
```

Export privatniho klice

```
gpg --output ondrejsika_private.asc --armor --export-secret-keys ondrej@ondrejsika.com
```

### Import verejneho (ciziho) klice

Ze souboru

```
gpg --import kolovsky.asc
```

z key serveru (defaultne nastaveneho v `~/.gnupg/gpg.conf`)

```
gpg --recv-keys KEY_ID
```
nebo key server specifikujete v parametru

```
gpg --recv-keys --keyserver pgp.mit.edu KEY_ID
```

### Podepsani verejneho klice

```
gpg --sign-key KEY_ID
```

### Odeslani verejneho klice na server

```
gpg --send-keys --keyserver KEY_ID
```

nebo

```
gpg --send-keys --keyserver pgp.mit.edu KEY_ID
```

### Import privatniho (vlastniho) klice

```
gpg --allow-secret-key-import --import ondrejsika_private.asc
```

### Seznam verejnych klicu

```
gpg --list-keys
```

### Zasifrovani souboru pro "kolovsky"

```
gpg --output file.gpg.asc --encrypt --armor --recipient frantisek@kolovsky.cz file
```

### Rozsifrovani souboru

```
gpg --output file --decrypt file.gpg.asc
```

### Symetricke sifrovani (zaheslovani) souboru

```
gpg --output file.gpg.asc --armor --symmetric file
```

Rozsifrovani je stejnym prikazem jako u asymetrickeho sifrovani

```
gpg --output file --decrypt file.gpg.asc
```

### Podepsani souboru

Spoji podpis a puvodni soubor do jednoho souboru

```
gpg --output file.signed.asc --armor --sign file
```

### Precteni podepsaneho souboru

```
gpg --output file --decrypt file.signed.asc
```

### Podpis v externim souboru

```
gpg --output file.sig.asc --armor --detach-sig file
```

### Verifikace podpisu

```
gpg --verify file.sig.asc file
```


Zdroj: <http://www.gnupg.org/gph/en/manual.html>