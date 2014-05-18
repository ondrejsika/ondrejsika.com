---
layout: post
title: Kill process on port in Linux
categories: blog

lang: EN
meta_keywords: kill proccess, linux, kill port
---

``` bash
fuser -n tcp -k 8000
```

or

``` bash
fuser -k 8000/tcp
```
