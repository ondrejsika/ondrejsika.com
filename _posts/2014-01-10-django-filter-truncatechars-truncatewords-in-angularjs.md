---
layout: post
title: Django filter truncatechars in AngularJS
categories: blog

lang: EN
meta_keywords: django, angular, truncatechars, truncate
---

{% raw %}

Prototype `String` class in CoffeeScript

``` coffeescript
String.prototype.truncatechars = (len)->
    this.substring(0, len)
```

or in JavaScript

``` coffeescript
String.prototype.truncatechars function(len){
    return this.substring(0, len);
}
```

Rewrite your django template from

``` html
<p>{ text|truncatechars: 20}}</p>
```

where `{{ }}` rendered by django template.

to

``` html
<p>{{ text.truncatechar(20) }}</p>
```

where `{{ }}` use AngularJS.

{% endraw %}
