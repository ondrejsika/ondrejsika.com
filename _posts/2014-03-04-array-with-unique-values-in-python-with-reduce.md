---
layout: post
title: Array with unique values in Python with reduce
categories: blog

lang: en
meta_keywords: python, unique array, reduce
---

Array must be sorted.

Basic example:

``` python
>>> array = [1, 2, 2, 3, 4, 4, 5]

>>> def func(output, element):
...     if not output:
...          return [element]
...     if element != output[-1]:
...         return output + [element]
...     else:
...         return output

>>> reduce(func, array, None)
[1, 2, 3, 4, 5]
```

More complicated, unique by some key in dict:

``` python
>>> array = [
...     {'id': 1, 'name': 'Ondrej'},
...     {'id': 1, 'name': 'ondrej'},
...     {'id': 2, 'name': 'John'},
... ]

>>> def func(output, element):
...         if not output:
...              return [element]
...         if element['id'] != output[-1]['id']:
...             return output + [element]
...         else:
...             return output

>>> reduce(func, array, None)
[{'id': 1, 'name': 'Ondrej'}, {'pk': 2, 'name': 'John'}]
```

