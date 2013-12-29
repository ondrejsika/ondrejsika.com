---
layout: post
title:  "getattr, setattr, hassattr recursive in Python"
categories: blog

lang: EN
meta_keywords: Python, attribustes, recrusive, setattr, getattr, hasattr
---

### hasattr2

```
def hasattr2(obj, attr):
    try:
        getattr(obj, attr)
        return True
    except AttributeError:
        try:
            a1 = attr[:attr.index(".")]
            a2 = attr[attr.index(".")+1:]
        except ValueError:
            return False
        return hasattr2(getattr(obj, a1), a2)
```

### getattr2

```
def getattr2(obj, attr, otherwise=None):
    try:
        return getattr(obj, attr)
    except AttributeError:
        try:
            a1 = attr[:attr.index(".")]
            a2 = attr[attr.index(".")+1:]
        except ValueError:
            return otherwise
        return getattr2(getattr(obj, a1), a2, otherwise)
```

### setattr2

```
def setattr2(obj, attr, value):
    if attr.rfind(".") != -1:
        a1 = attr[:attr.rfind(".")]
        a2 = attr[attr.rfind(".")+1:]
    else:
        setattr(obj, attr, value)
        return
    if not hasattr2(obj, a1):
        raise AttributeError
    setattr(getattr2(obj, a1), a2, value)
```