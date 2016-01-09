---
layout: post
title: Array with unique values in Python with reduce

lang: EN
---

### Sorted array (quick)

Example 1

    >>> array = [1, 2, 2, 3, 4, 4, 5]

    >>> def func(output, element):
    ...     if not output:
    ...          return [element]
    ...     if element != output[-1]:
    ...         return output + [element]
    ...     else:
    ...         return output

    >>> reduce(func, array, [])
    [1, 2, 3, 4, 5]

Example 2

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

    >>> reduce(func, array, [])
    [{'id': 1, 'name': 'Ondrej'}, {'pk': 2, 'name': 'John'}]

### Unsorted array (slow)

Example 3

    >>> array = [1, 2, 5, 4, 2, 4, 3]

    >>> def func(output, element):
    ...     if element not in output:
    ...         return output + [element]
    ...     else:
    ...         return output

    >>> reduce(func, array, [])
    [1, 2, 5, 4, 3]

or inline:

    >>> reduce(lambda output, element: output + [element] if element not in outout else output, array, [])
    [1, 2, 5, 4, 3]

