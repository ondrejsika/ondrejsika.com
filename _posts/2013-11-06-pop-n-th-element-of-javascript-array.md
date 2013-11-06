---
layout: post
title:  "Pop n-th element of JavaScript Array"
date:   2013-11-06 22:19:53
categories: blog

lang: EN
---

### Prototype

#### JavaScript

```
Array.prototype.pop = function(n){
    if (i !== undefined)
        return this.splice(n, 1)[0];
    return this.splice(this.length-1, 1)[0];
}
```


#### CoffeeScript

```
Array.prototype.pop = (n) ->
    if i
        return this.splice(n, 1)[0]
    return this.splice(this.length-1, 1)[0]
```

### Example of usage

```
> array = [0, 1, 2, 3]
[0, 1, 2, 3]
> aray.pop(0)
0
> array
[1, 2, 3]
> array.pop()
3
> array
[1, 2]
```