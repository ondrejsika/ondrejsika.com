---
layout: post
title:  Encrypt & Decrypt file in Linux
categories: blog

lang: EN
meta_keywords: encrypt, decrypt, file, linux, openssl
---

Use openssl

``` bash
KEY="secretkey"

encrypt="openssl aes-256-cbc -a -salt -k $KEY"
decrypt="openssl aes-256-cbc -a -d -salt -k $KEY"


cat input.txt | $encrypt > crypted.txt
cat crypted.txt | $decrypt > output.txt
```

file __input.txt__

```
Hello World
```

file __crypted.txt__

```
U2FsdGVkX18NtMIrL2VOBK7tMQt0LqgDfBgZ4DvcyMk=
```

file __output.txt__

```
Hello World
```