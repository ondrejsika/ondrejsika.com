---
layout: post
title:  "Pop object by key:value of JavaScript Array"
date:   2013-11-06 22:56:53
categories: blog

lang: EN
---

### Prototype

Require [Aray.pop(n)](/blog/2013/11/06/pop-n-th-element-of-javascript-array.html)

#### JavaScript

```
Array.prototype.popBy = function(key, val){
    for(var i=0; i<this.length; i++){
        if (this[i][key] == val) return this.pop(i);
    }
}
```


#### CoffeeScript

```
Array.prototype.popBy = (key, val) ->
    for i in [0..this.length]
        if this[i][key] == val
            return this.pop i
```

### Example of usage

```
> array = [{a:0, b: 5}, {a:1, b:6}, {a:2, b:7}, {a:3, b:8}, {a:4, b:9}]
[{a:0, b: 5}, {a:1, b:6}, {a:2, b:7}, {a:3, b:8}, {a:4, b:9}]
> array.popBy("a", 3)
{a:3, b:8}
> array
[{a:0, b: 5}, {a:1, b:6}, {a:2, b:7}, {a:4, b:9}]
> array.popBy("b", 6)
{a:1, b:6}
> array
[{a:0, b: 5}, {a:2, b:7}, {a:4, b:9}]
```