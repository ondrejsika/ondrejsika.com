---
layout: post
title:  Zakladni funkce a pouziti GnuPG
categories: blog

lang: CZ
meta_keywords: GPG, GnuPG, PGP
---

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

```
gpg --import kolovsky.asc
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