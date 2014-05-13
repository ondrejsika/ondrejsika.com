---
layout: post
title:  "Pop n-th element of JavaScript Array"
date:   2013-11-06 22:19:53
categories: blog

lang: EN
meta_keywords: javascript, coffeescript, pop
---

### Prototype

#### JavaScript

``` javascript
Array.prototype.pop = function(n){
    if (n !== undefined)
        return this.splice(n, 1)[0];
    return this.splice(this.length-1, 1)[0];
}
```


#### CoffeeScript

``` coffee
Array.prototype.pop = (n) ->
    if n
        return this.splice(n, 1)[0]
    return this.splice(this.length-1, 1)[0]
```

### Example of usage

``` javascript
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
