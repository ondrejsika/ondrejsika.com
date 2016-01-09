---
layout: post
title: .pythonrc.py
categories: blog

lang: EN
---
Similar to bashrc Python has own rc. Set it in .bashrc this line.

    export PYTHONSTARTUP=$HOME/.pythonrc.py

and configure your pythonrc.

    echo 'print "Hello Ondrej!"; from pprint import pprint as pp' > .pythonrc.py

ad enjoy your pythonrc

    sika@sika-x1:~$ python
    Python 2.7.9 (default, Mar  1 2015, 12:57:24) 
    [GCC 4.9.2] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    Hello Ondrej!
    >>> pp
    <function pprint at 0x7f7a148a8c80>
    >>>

Source: <http://eseth.org/2008/pimping-pythonrc.html>


