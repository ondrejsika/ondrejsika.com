---
layout: post
title: Enumerate list of tuples in Python
categories: blog

lang: EN
---

This is a way how to enumerate list of tuples in Python with easy access to each part of tupple and to iterator.

    >>> array = [(1, 2), (3, 4)]
    >>> for i, (a, b) in enumerate(array):
    >>>     print i, '-', a, b

    0 - 1 2
    1 - 3 4

