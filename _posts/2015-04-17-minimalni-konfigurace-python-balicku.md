---
layout: post
title: Minimalni konfigurace Python balicku

lang: CS
---

Nejmensi mozna konfigurace Python balicku je pouze toto:

setup.py:

    from setuptools import setup, find_packages

    setup(
        name='pythonkniha',
        version='2',
        py_modules=['pythonkniha'],
    )

ale je to opravu minimalni, proto je podle mne lepsi pridat jeste par parametru:

setup.py:

    from setuptools import setup, find_packages

    setup(
        name='pythonkniha',
        version='2',
        author='Ondrej Sika',
        author_email='ondrej@ondrejsika.com',
        description='Example package',
        url='http://ondrejsika.com/books/python-kniha',
        py_modules=['pythonkniha'],
    )

