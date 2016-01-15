---
layout: post
title: Install m2crypto to Debian via PIP
categories: blog

lang: EN
---

Install system dependences

    sudo apt-get install python-dev libssl-dev swig

Create link to opensslconf.h

    sudo ln -s /usr/include/x86_64-linux-gnu/openssl/opensslconf.h /usr/include/openssl/opensslconf.h

And instal by PIP (everywhere)

    pip install m2crypto


Sources:

- <https://stackoverflow.com/questions/31762106/swig-unable-to-find-openssl-conf/31861876#31861876>
- <https://blog.rectalogic.com/2013/11/installing-m2crypto-in-python.html>



